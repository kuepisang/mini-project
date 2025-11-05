import prisma from "../config/prisma-client";
import { addMonths } from "../utils/date";
import { Prisma } from "../generated/prisma";

const REFERRAL_POINT_BONUS = 10_000;

export async function applyReferralEffects(opts: {
  tx: Omit<typeof prisma, "$transaction">; // transactional client
  refereeUserId: string;
  referralCode: string;
}) {
  const { tx, refereeUserId, referralCode } = opts;

  // 1) Cari referrer dari referral_code
  const referrer = await tx.users.findUnique({
    where: { referral_code: referralCode },
    select: { id: true },
  });
  if (!referrer) throw new Error("Invalid referral code");
  if (referrer.id === refereeUserId) throw new Error("You cannot refer yourself");

  const now = new Date();
  const expiresIn3Months = addMonths(now, 3);

  // 2) Catat hubungan referral (sekali saja per referee_id — UNIQUE by schema)
  await tx.referral_uses.create({
    data: {
      referrer_id: referrer.id,
      referee_id: refereeUserId,
      referred_at: now,
    },
  });

  // 3) set users.referred_by_id
  await tx.users.update({
    where: { id: refereeUserId },
    data: { referred_by_id: referrer.id },
  });

  // 4) Buat coupon + issuance untuk referee (kadaluarsa 3 bulan)
  const coupon = await tx.coupons.create({
    data: {
      code: `REF-${Math.random().toString(36).slice(2, 10).toUpperCase()}`,
      type: "FIXED" as any,             
      value: new Prisma.Decimal(50000),
      is_active: true,
    },
  });

  await tx.coupon_issuances.create({
    data: {
      coupon_id: coupon.id,
      user_id: refereeUserId,
      issued_at: now,
      expires_at: expiresIn3Months,
      status: "unused",
    },
  });

  // 5) Tambah point ke REFERRER (10.000) kadaluarsa 3 bulan
  await tx.point_ledger.create({
    data: {
      user_id: referrer.id,
      points: REFERRAL_POINT_BONUS,
      reason: "REFERRAL_BONUS",
      related_txn_id: null,
      granted_at: now,
      expires_at: expiresIn3Months,
      note: `Bonus referral dari user ${refereeUserId}`,
    },
  });

  return { referrerId: referrer.id, couponCode: coupon.code };
}
