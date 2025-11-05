import { customAlphabet } from "nanoid";
import prisma from "../config/prisma-client";

const nano = customAlphabet('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789', 8);

export async function generateReferralCode(): Promise<string> {
for (let i = 0; i < 10; i++) {
const code = nano();
const found = await prisma.users.findUnique({
where: { referral_code: code },
select: { id: true }
});

console.log(`Code ${code} exists:`, !!found);

if (!found) return code;
}
throw new Error('Failed to generate unique referral code');
}