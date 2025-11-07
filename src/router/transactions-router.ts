import { Router } from "express";
import { createTransactionsController } from "../controller/transactions-controller";
const router = Router();

router.post('/', createTransactionsController)

export default router;