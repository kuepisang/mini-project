import { Request, Response, NextFunction } from "express";

const WHITELIST = [
  process.env.CORS_WHITELIST_URL_1,
  process.env.CORS_WHITELIST_URL_2,
].filter(Boolean) as string[];

// Helper: cek apakah origin diizinkan
function isAllowedOrigin(origin?: string | null): origin is string {
  if (!origin) return true; // allow tools tanpa origin (Postman)
  if (WHITELIST.includes(origin)) return true;

  // fallback dev: izinkan variasi localhost/127.0.0.1 port 3000
  if (origin.startsWith("http://localhost:3000")) return true;
  if (origin.startsWith("http://127.0.0.1:3000")) return true;

  return false;
}

export function customCors(req: Request, res: Response, next: NextFunction) {
  const origin = req.headers.origin as string | undefined;

  if (isAllowedOrigin(origin)) {
    if (origin) {
      res.header("Access-Control-Allow-Origin", origin);
      // penting: supaya proxy/cache menilai header berdasarkan Origin
      res.header("Vary", "Origin");
    }
    // kalau pakai cookie / credentials: 'include'
    res.header("Access-Control-Allow-Credentials", "true");

    // header & methods yang diizinkan
    res.header(
      "Access-Control-Allow-Headers",
      "Content-Type, Authorization"
    );
    res.header(
      "Access-Control-Allow-Methods",
      "GET,POST,PUT,PATCH,DELETE,OPTIONS"
    );

    // Preflight harus diakhiri di sini
    if (req.method === "OPTIONS") {
      return res.sendStatus(204);
    }

    return next();
  }

  // Origin tidak di whitelist
  if (req.method === "OPTIONS") {
    // tanggapi preflight supaya browser tidak hang
    return res.status(403).send("Not allowed by CORS");
  }

  return res.status(403).json({
    success: false,
    message: "Not allowed by CORS",
    data: null,
  });
}
