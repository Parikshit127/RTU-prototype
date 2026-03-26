import { Router, Request, Response } from 'express';
import { fees } from '../data/mock-data';

const feesRoutes = Router();

feesRoutes.get('/', (req: Request, res: Response) => {
  res.json(fees);
});

export { feesRoutes };
