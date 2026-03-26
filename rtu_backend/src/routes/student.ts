import { Router, Request, Response } from 'express';
import { studentProfile } from '../data/mock-data';

const studentRoutes = Router();

studentRoutes.get('/', (req: Request, res: Response) => {
  res.json(studentProfile);
});

studentRoutes.get('/profile', (req: Request, res: Response) => {
  res.json(studentProfile);
});

export { studentRoutes };
