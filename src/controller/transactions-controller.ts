import { Request, Response } from 'express';
import { createTransactionsService } from '../service/transactions-service';


export async function createTransactionsController(req: Request, res: Response) {
  try {
    const { user_id , organizer_id, status, subtotal_idr, discount_voucher, discount_coupon, discount_points, fees_idr, total_idr, voucher_id, coupon_issuance_id, points_debited, payment_proof_url } = req.body;

    await createTransactionsService({ user_id , organizer_id, status, subtotal_idr, discount_voucher, discount_coupon, discount_points, fees_idr, total_idr, voucher_id, coupon_issuance_id, points_debited, payment_proof_url });

    res.status(201).json({
      success: true,
      message: 'Create organizer successfull',
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
      },
    });
  } catch (error: any) {
    res.status(400).json({
      success: false,
      message: error?.message,
      data: null,
    });
  }
}
