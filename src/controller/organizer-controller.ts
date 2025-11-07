import { Request, Response } from 'express';
import { createOrganizerService } from '../service/organizer-service';

export async function createOrganizerController(req: Request, res: Response) {
  try {
    const { user_id , brand_name, description, website } = req.body;

    await createOrganizerService({ user_id, brand_name, description, website });

    res.status(201).json({
      success: true,
      message: 'Create organizer successfull',
      data: {
        user_id,
        brand_name,
        description,
        website,
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
