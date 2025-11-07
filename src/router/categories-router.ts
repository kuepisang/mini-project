import { Router } from "express";
import { createCategoriesController } from "../controller/categories-controller";

const router = Router();

router.post ('/', createCategoriesController)

export default router;