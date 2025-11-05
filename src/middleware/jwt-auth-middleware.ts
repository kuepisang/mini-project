import { NextFunction, Request, Response } from 'express';
import jwt from 'jsonwebtoken';
import { AccesJwtPayload, AppRole } from '../types/auth';


export const jwtVerify = (secret: string) => {
 return (req: Request, res: Response, next: NextFunction) => {
   try {
    const token = req.headers.authorization?.split(' ')[1];
    if (!token) return res.status(401).json({
      success: false,
      message: 'No token provided',
      data: null,
    });
    const payload = jwt.verify(token, secret) as AccesJwtPayload;
    res.locals.payload = payload;
    next();
   } catch (error) {
    return res.status(401).json({
      success: false,
      message: 'Invalid token',
      data: null,
    });
   }
 }
}


export const roleVerify = (allowed: AppRole[]) => {
  return (req: Request, res: Response, next: NextFunction) => {
    const payload = res.locals.payload as AccesJwtPayload | undefined;
    if (!payload) return res.status(401).json({
      success: false,
      message: 'Unauthorized user',
      data: null,
    });

    if (!allowed.includes(payload.role)) return res.status(403).json({
      success: false,
      message: 'Forbidden',
      data: null,
    });
    next();
  };
};