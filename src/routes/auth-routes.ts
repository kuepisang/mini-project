import { Router } from 'express';
import { registerUserController, loginUserController, refreshTokenController, logoutController, switchRoleToOrganizerController } from '../controller/auth-controller';
import { jwtVerify, roleVerify } from '../middleware/jwt-auth-middleware';
const router = Router();

router.post('/register', registerUserController);
router.post('/login', loginUserController);
router.post('/refresh-token', refreshTokenController);
router.post('/logout', logoutController);

router.post('/switch-role-organizer', jwtVerify(process.env.JWT_SECRET_KEY!), roleVerify(['CUSTOMER', 'ORGANIZER']), switchRoleToOrganizerController);
export default router;