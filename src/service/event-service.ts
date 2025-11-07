import prisma from '../config/prisma-client';
import { events } from '../generated/prisma';

export async function createEventsService({
        organizer_id,
        title,
        description,
        category_id,
        address,
        city, 
        province, 
        country, 
        start_time, 
        end_time, 
        capacity, 
        seats_available, 
        is_published
}: Pick<events, 'organizer_id' | 'title' | 'description' | 'category_id' | 'address' | 'city' | 'province' | 'country' | 'start_time' | 'end_time' | 'capacity' | 'seats_available' | 'is_published'>) {

      // ✅ Validasi input waktu
    if (!start_time || !end_time) {
    throw new Error('Start time and end time are required');
    }

    const newEvent = await prisma.events.create({
        data: {
        organizer_id,
        title,
        description,
        category_id,
        address,
        city, 
        province, 
        country, 
        start_time: new Date(start_time), 
        end_time: new Date(end_time), 
        capacity: Number(capacity), 
        seats_available: Number(seats_available), 
        is_published
    }
 })
    return newEvent;
}