import { Router, Request, Response } from 'express';
import { classes } from '../data/mock-data';

const scheduleRoutes = Router();

scheduleRoutes.get('/', (req: Request, res: Response) => {
  res.json(classes);
});

scheduleRoutes.get('/day/:dayOfWeek', (req: Request, res: Response) => {
  const dayOfWeek = req.params.dayOfWeek.toLowerCase();
  const filtered = classes.filter((cls: any) => cls.day.toLowerCase() === dayOfWeek);
  res.json(filtered);
});

export { scheduleRoutes };
