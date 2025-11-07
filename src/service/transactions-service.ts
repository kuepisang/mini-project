import prisma from "../config/prisma-client";
import { transactions } from "../generated/prisma";

export async function createTransactionsService({
    user_id , organizer_id, status, subtotal_idr, discount_voucher, discount_coupon, discount_points, fees_idr, total_idr, voucher_id, coupon_issuance_id, points_debited, payment_proof_url
}:Pick<transactions, 'user_id' | 'organizer_id' | 'status' | 'subtotal_idr' | 'discount_voucher' | 'discount_coupon' | 'discount_points' | 'fees_idr' | 'total_idr' | 'voucher_id' | 'coupon_issuance_id' | 'points_debited' | 'payment_proof_url'>){
    await prisma.transactions.create({
        data: {
            user_id, 
            organizer_id, 
            status, 
            subtotal_idr, 
            discount_voucher, 
            discount_coupon, 
            discount_points, 
            fees_idr, 
            total_idr, 
            voucher_id, 
            coupon_issuance_id, 
            points_debited, 
            payment_proof_url
        }
    })
}