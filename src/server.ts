import express, { Express, NextFunction, Request, Response } from 'express';
// import authRouter from './router/auth-router';
import organizerRouter from './router/organizer-router'
import ticketsRouter from './router/tickets-router'
import eventRouter from './router/event-router'
import transactionsRouter from './router/transactions-router'
import categoriesRouter from './router/categories-router'
import dotenv from 'dotenv';

dotenv.config();

const app: Express = express();
app.use(express.json());
const port = 4000;

app.get('/', (_: Request, res: Response) => {
  res.send('<h1>Welcome to API Server</h1>');
});

// app.use('/api/auth', authRouter );
app.use('/api/organizer', organizerRouter)
app.use('/api/tickets', ticketsRouter)
app.use('/api/events', eventRouter)
app.use('/api/transactions', transactionsRouter)
app.use('/api/categories', categoriesRouter)

// Centralized Error (Middleware untuk handling error (application level))
app.use((error: any, req: Request, res: Response, next: NextFunction) => {
  res.status(500).json({
    success: false, 
    message: error?.message, 
    data: null
  })
})

app.listen(port, () => {
  console.log(`🚀 Server running on http://localhost:${port}`);
});
