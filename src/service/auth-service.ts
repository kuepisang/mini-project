import prisma from "../config/prisma-client";
import bcrypt from "bcrypt";
import { generateReferralCode } from "../utils/referral";
import { verifyRefreshToken, signAccessToken, signRefreshToken } from "../utils/jwt";
import { getReferrerId, issueTokenPair, bumpRefreshVersion, selectUserSafe } from "../utils/auth-helpers";
import { applyReferralEffects } from "./referral-service";

const ACCESS_TTL = "1h";
const REFRESH_TTL = `${24 * 7}h`;

// Combined selectors
const userWithVersion = { ...selectUserSafe, refresh_token_version: true } as const;
const userWithPassword = { id: true, password: true, role: true, refresh_token_version: true, email: true, full_name: true, phone_number: true, referral_code: true } as const;

interface AuthParams {
  email: string;
  password: string;
  full_name?: string;
  phone_number?: string;
  referral_code?: string;
}

export async function registerUserService({ email, password, full_name, phone_number, referral_code }: Required<Omit<AuthParams, 'referral_code'>> & Pick<AuthParams, 'referral_code'>) {
  const existingUser = await prisma.users.findUnique({ where: { email } });
  if (existingUser) throw new Error("Email already registered");

  const created = await prisma.users.create({
    data: {
      email,
      password: await bcrypt.hash(password, 10),
      full_name,
      phone_number,
      referral_code: await generateReferralCode(),
      referred_by_id: await getReferrerId(referral_code),
      profile: { create: { display_name: full_name } },
    },
    select: userWithVersion,
  });

  const tokens = await issueTokenPair(String(created.id), created.role, created.refresh_token_version);
  const { refresh_token_version: _v, ...user } = created;
  return { user, tokens };
}

export async function loginUserService({ email, password }: Pick<AuthParams, 'email' | 'password'>) {
  const u = await prisma.users.findUnique({ where: { email }, select: userWithPassword });
  if (!u) throw new Error("User not found");
  if (!await bcrypt.compare(password, u.password)) throw new Error("Invalid password");

  const { password: _pw, refresh_token_version, ...user } = u;
  const tokens = await issueTokenPair(String(user.id), user.role, refresh_token_version);
  return { user, tokens };
}

export async function refreshTokenService(refreshToken: string, _ip?: string) {
  const { userId, version } = verifyRefreshToken(refreshToken);
  const user = await prisma.users.findUnique({ where: { id: userId as any }, select: userWithVersion });
  if (!user) throw new Error("User not found");

  const userWithToken = user as any;
  if (userWithToken.refresh_token_version !== version) throw new Error("Invalid refresh token");

  const accessToken = signAccessToken({ userId: String(user.id), role: user.role }, ACCESS_TTL);
  const newRefreshToken = signRefreshToken(String(user.id), userWithToken.refresh_token_version, REFRESH_TTL);
  const { refresh_token_version: _v, ...safeUser } = userWithToken;
  
  return { user: safeUser, tokens: { accessToken, refreshToken: newRefreshToken } };
}

export async function logoutService(refreshToken: string) {
  try {
    const { userId } = verifyRefreshToken(refreshToken);
    await bumpRefreshVersion(userId);
  } catch {
    // idempotent logout - ignore errors
  }
}

export async function switchRoleToOrganizerService(userId: string, brand_name?: string) {
  await bumpRefreshVersion(userId);
  
  const [user] = await Promise.all([
    prisma.users.update({ where: { id: userId as any }, data: { role: "ORGANIZER" }, select: { id: true, role: true } }),
    prisma.organizers.upsert({ where: { user_id: userId as any }, update: { brand_name }, create: { user_id: userId as any, brand_name } })
  ]);

  const tokens = await issueTokenPair(String(user.id), user.role, 1);
  return { user: { id: String(user.id), role: user.role }, tokens };
}