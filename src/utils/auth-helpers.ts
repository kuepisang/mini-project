import prisma from "../config/prisma-client";
import { signAccessToken, signRefreshToken } from "./jwt";
import { addHours } from "date-fns";
import { AppRole } from "../types/auth";

const ACCESS_TTL = "1h";
const REFRESH_TTL_HOURS = 24 * 7;
const REFRESH_TTL = `${REFRESH_TTL_HOURS}h`;

export const hoursFromNow = (h: number) => addHours(new Date(), h);

// ambil id pemilik referral (kalau ada)
export async function getReferrerId(referral_code?: string) {
  if (!referral_code) return undefined;
  const ref = await prisma.users.findUnique({
    where: { referral_code },
    select: { id: true },
  });
  if (!ref) throw new Error("Invalid referral code");
  return ref.id;
}

// buat access + refresh token & simpan sesi
export async function issueTokenPair(
  userId: string,
  role: AppRole,
  version: number
) {
  const accessToken = signAccessToken({ userId, role }, ACCESS_TTL);
  const refreshToken = signRefreshToken(userId, version, REFRESH_TTL);
  return { accessToken, refreshToken };
}

// revoke semua refresh token dengan menaikkan versi
export async function bumpRefreshVersion(userId: string) {
  await prisma.users.update({
    where: { id: userId as any },
    data: { refresh_token_version: { increment: 1 } } as any,
    select: { id: true },
  });
}

// reuse untuk select data user yang aman
export const selectUserSafe = {
  id: true,
  email: true,
  full_name: true,
  phone_number: true,
  referral_code: true,
  role: true,
} as const;
