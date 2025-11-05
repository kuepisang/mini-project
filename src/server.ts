import "dotenv/config";
import express, { Express, Request, Response } from 'express';
import authRouter from './routes/auth-routes'
import { NextFunction } from 'express';
import { customCors } from './middleware/cors-middleware';

const app: Express = express();

// app.use(cors()); // Default config, artinya API akan memberikan izin sharing resource dari client manapun
app.use(customCors); // Custom CORS Middleware
app.use(express.json());
const port = 4000;

app.get('/', (_: Request, res: Response) => {
  res.send('<h1>Welcome to API Server</h1>');
});

app.use(`/api/auth`, authRouter);

// Centralized Error (Middleware untuk handling error (application level))
app.use((error: any, req: Request, res: Response, next: NextFunction) => {
  res.status(500).json({
    success: false, 
    message: error?.message, 
    data: null
  })
})

app.listen(port, () => {
  console.log(`⚡️[server]: Server is running at http://localhost:${port}`);
});