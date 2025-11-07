import { Router } from "express";
import { creatEventsController } from "../controller/event-controller";
const router = Router();

router.post ('/', creatEventsController)

export default router;