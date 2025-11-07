import { Request, Response } from 'express';
import { createTicketsService } from '../service/tickets-service';

export async function createTicketsController(req: Request, res: Response) {
  try {
    const { transaction_item_id, event_id, ticket_type_id, ticket_code, status, issued_at, checked_in_at } = req.body;

    await createTicketsService({ transaction_item_id, event_id, ticket_type_id, ticket_code, status, issued_at, checked_in_at });

    res.status(201).json({
      success: true,
      message: 'Create organizer successfull',
      data: {
        transaction_item_id,
        event_id,
        ticket_type_id,
        ticket_code,
        status,
        issued_at,
        checked_in_at
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
