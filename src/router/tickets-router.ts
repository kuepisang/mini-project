import { Router } from "express";
import { createTicketsController } from "../controller/tickets-controller";
const router = Router();

router.post ('/', createTicketsController)

export default router