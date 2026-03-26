import { Router, Request, Response } from 'express';
import { faculties, news, admissionsInfo, researchHighlights } from '../data/mock-data';

const publicRoutes = Router();

publicRoutes.get('/faculties', (req: Request, res: Response) => {
  res.json(faculties);
});

publicRoutes.get('/news', (req: Request, res: Response) => {
  res.json(news);
});

publicRoutes.get('/admissions', (req: Request, res: Response) => {
  res.json(admissionsInfo);
});

publicRoutes.get('/research', (req: Request, res: Response) => {
  res.json(researchHighlights);
});

export { publicRoutes };
