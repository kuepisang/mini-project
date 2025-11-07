import { Request, Response } from 'express';
import { createEventsService } from '../service/event-service';

export async function creatEventsController(req: Request, res: Response) {
  try {
    const { organizer_id, title, description, category_id, address, city, province, country, start_time, end_time, capacity, seats_available, is_published } = req.body;

    await createEventsService({ organizer_id, title, description, category_id, address, city, province, country, start_time, end_time, capacity, seats_available, is_published });

    res.status(201).json({
      success: true,
      message: 'Create event successfull',
      data: {
        organizer_id,
        title,
        description,
        category_id,
        status,
        address,
        city, 
        province, 
        country, 
        start_time, 
        end_time, 
        capacity, 
        seats_available, 
        is_published
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
