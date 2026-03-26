import { Router, Request, Response } from 'express';
import { grades } from '../data/mock-data';

const gradesRoutes = Router();

gradesRoutes.get('/', (req: Request, res: Response) => {
  res.json(grades);
});

gradesRoutes.get('/semester/:id', (req: Request, res: Response) => {
  const semesterId = req.params.id;
  const semester = grades.semesters.find((sem: any) => sem.id === semesterId);

  if (semester) {
    res.json(semester);
  } else {
    res.status(404).json({ error: 'Semester not found' });
  }
});

export { gradesRoutes };
