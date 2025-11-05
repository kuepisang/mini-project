import { sign, verify, JwtPayload } from "jsonwebtoken";
import { AccesJwtPayload } from "../types/auth";

if (!process.env.JWT_SECRET_KEY || !process.env.REFRESH_JWT_SECRET_KEY) {
  throw new Error("JWT secrets are required");
}

const ACCESS_SECRET = process.env.JWT_SECRET_KEY;
const REFRESH_SECRET = process.env.REFRESH_JWT_SECRET_KEY;

export function signAccessToken(
  payload: AccesJwtPayload,
  expiresIn: string = "1h"
): string {
  return sign(payload, ACCESS_SECRET, { expiresIn } as any);
}

export function signRefreshToken(
  userId: string,
  version: number,
  expiresIn: string = "7d"
): string {
   return sign ({ v: version }, REFRESH_SECRET, {
    expiresIn,
    subject: userId,
   } as any);
};

export function verifyRefreshToken(token: string) {
  const decoded = verify(token, REFRESH_SECRET) as JwtPayload & { v?: number };
  if (!decoded.sub) throw new Error("Malformed token");
  const version = typeof decoded.v === "number" ? decoded.v : NaN;
  if (Number.isNaN(version)) throw new Error("Malformed token version");
  return { userId: decoded.sub as string, version };
  }
