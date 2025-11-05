import type { users } from "../generated/prisma";

export type AppRole = users["role"];
export type AccesJwtPayload = { userId: string; role: AppRole };
