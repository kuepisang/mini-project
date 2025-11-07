import prisma from '../config/prisma-client';
import { organizers } from '../generated/prisma';

export async function createOrganizerService({
  user_id,
  brand_name,
  description,
  website,
}: Pick<organizers, 'user_id' | 'brand_name' | 'description' | 'website'>) {
    await prisma.organizers.create({
        data: {
            user_id,
            brand_name,
            description,
            website,
        }
    })
}
