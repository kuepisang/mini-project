import dotenv from 'dotenv';
import path from 'path';

dotenv.config({
  path: path.resolve(process.cwd(), '.env'),
});

export const CORS_WHITELIST_URL_1 = process.env.CORS_WHITELIST_URL_1
export const CORS_WHITELIST_URL_2 = process.env.CORS_WHITELIST_URL_2
export const JWT_SECRET_KEY = process.env.JWT_SECRET_KEY
export const NEXT_AUTH_INTERNAL_SECRET = process.env.NEXTAUTH_INTERNAL_SECRET