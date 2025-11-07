import { Router } from "express";
import { createOrganizerController } from "../controller/organizer-controller";
const router = Router();

router.post ('/', createOrganizerController)

export default router