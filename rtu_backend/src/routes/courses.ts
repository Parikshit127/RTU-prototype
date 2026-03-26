import { Router, Request, Response } from 'express';
import { grades } from '../data/mock-data';

const coursesRoutes = Router();

coursesRoutes.get('/', (req: Request, res: Response) => {
  // Extract list of enrolled courses from grades data
  const enrolledCourses: any[] = [];

  grades.semesters.forEach((semester: any) => {
    if (semester.courses) {
      semester.courses.forEach((course: any) => {
        enrolledCourses.push({
          ...course,
          semester: semester.id
        });
      });
    }
  });

  res.json(enrolledCourses);
});

export { coursesRoutes };
