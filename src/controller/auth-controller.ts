import { Request, Response } from 'express';
import { registerUserService, loginUserService, refreshTokenService, logoutService, switchRoleToOrganizerService } from '../service/auth-service';

export async function registerUserController(req: Request, res: Response) {
  try {
    const { email, password, full_name, phone_number, referral_code } = req.body;
    
    await registerUserService({ 
        email, 
        password, 
        full_name, 
        phone_number, 
        referral_code, 
    });
    
    res.status(201).json({
      success: true,
      message: 'User registered successfully',
      data: [full_name]
    });
  } catch (error: any) {
    res.status(500).json({
      success: false,
      message: error?.message,
      data: null
    });
  }     
}

export async function loginUserController(req: Request, res: Response) {
    try {
        const { email, password } = req.body;
       
        const safeUser = await loginUserService({ email, password });

        res.status(200).json({
            success: true,
            message: 'User logged in successfully',
            data: safeUser
        });
    } catch (error:any) {
        res.status(500).json({
            success: false,
            message: error?.message,
            data: null
        }); 
    }
}

export async function refreshTokenController(req: Request, res: Response) {
  try {
    const { refreshToken } = req.body;
    const data = await refreshTokenService(refreshToken, req.ip);
    res.status(200).json({
      success: true,
      message: 'Token refreshed successfully',
      data,
    });
  } catch (error: any) {
    res.status(500).json({
      success: false,
      message: error?.message,
      data: null,
    });
  }
}

export async function logoutController(req: Request, res: Response) {
  try {
    const { refreshToken } = req.body;
    await logoutService(refreshToken);
    res.status(200).json({
      success: true,
      message: 'User logged out successfully',
      data: null,
    });
  } catch (error) {
    res.status(500).json({
      success: false,
      message: (error as any)?.message,
      data: null,
    });
  }
}

export async function switchRoleToOrganizerController(req: Request, res: Response) {
  try {
    const userId = res.locals.payload.userId as string;
    const { brand_name } = req.body;
    const data = await switchRoleToOrganizerService(userId, brand_name);
    res.status(200).json({
      success: true,
      message: 'Role switched to ORGANIZER successfully, please login again',
      data,
    });
  } catch (error: any) {
    res.status(500).json({
      success: false,
      message: error?.message,
      data: null,
    });
  }
}