import { Router, Request, Response } from 'express';
import { studentProfile } from '../data/mock-data';

const authRoutes = Router();

authRoutes.post('/login', (req: Request, res: Response) => {
  // Accept any credentials and return mock token + student profile
  const mockToken = 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdHVkZW50SWQiOiJzdHUwMDEifQ.mock';

  res.json({
    token: mockToken,
    student: studentProfile
  });
});

export const authRoutes as const;
