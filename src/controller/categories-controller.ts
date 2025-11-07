import { Request, Response } from 'express';
import { createCategoriesService } from '../service/categories-service';


export async function createCategoriesController(req: Request, res: Response) {
  try {
    const { name } = req.body; 

    await createCategoriesService({ name });

    res.status(201).json({
      success: true,
      message: 'Create category successful',
      data: {
        name,
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
