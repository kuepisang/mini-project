import prisma from '../config/prisma-client';
import { tickets } from '../generated/prisma';

export async function createTicketsService({
  transaction_item_id,
  event_id,
  ticket_type_id,
  ticket_code,
  status,
  issued_at,
  checked_in_at,
}: Pick<tickets, 'transaction_item_id' | 'event_id' | 'ticket_type_id' | 'ticket_code' | 'status' | 'issued_at' | 'checked_in_at'>) {
    await prisma.tickets.create({
        data: {
            transaction_item_id,
            event_id,
            ticket_type_id,
            ticket_code,
            status,
            issued_at,
            checked_in_at
        }
    })
}
