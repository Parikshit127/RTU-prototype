'use client';

import { useState } from 'react';
import { TrendingUp, Award, BookOpen, ChevronDown } from 'lucide-react';

const semesters = [
  {
    id: 'spring-2026',
    name: 'Spring 2026',
    gpa: 7.84,
    credits: 18,
    status: 'In Progress',
    courses: [
      { code: 'DatZ3001', name: 'Data Structures & Algorithms', credits: 4, grade: 8, status: 'Graded' },
      { code: 'MatZ2001', name: 'Linear Algebra', credits: 3, grade: 7, status: 'Graded' },
      { code: 'DatZ3015', name: 'Web Technologies', credits: 4, grade: 9, status: 'Graded' },
      { code: 'FizZ1002', name: 'Physics II', credits: 3, grade: null, status: 'In Progress' },
      { code: 'DatZ4020', name: 'Operating Systems', credits: 4, grade: null, status: 'In Progress' },
    ],
  },
  {
    id: 'autumn-2025',
    name: 'Autumn 2025',
    gpa: 8.12,
    credits: 20,
    status: 'Completed',
    courses: [
      { code: 'DatZ2010', name: 'Object-Oriented Programming', credits: 4, grade: 9, status: 'Graded' },
      { code: 'MatZ1003', name: 'Calculus II', credits: 4, grade: 7, status: 'Graded' },
      { code: 'DatZ2015', name: 'Database Systems', credits: 4, grade: 8, status: 'Graded' },
      { code: 'EkonZ1001', name: 'Engineering Economics', credits: 4, grade: 8, status: 'Graded' },
      { code: 'ValZ1001', name: 'English for Engineers', credits: 4, grade: 9, status: 'Graded' },
    ],
  },
  {
    id: 'spring-2025',
    name: 'Spring 2025',
    gpa: 7.65,
    credits: 20,
    status: 'Completed',
    courses: [
      { code: 'DatZ1001', name: 'Introduction to Programming', credits: 4, grade: 8, status: 'Graded' },
      { code: 'MatZ1001', name: 'Calculus I', credits: 4, grade: 7, status: 'Graded' },
      { code: 'FizZ1001', name: 'Physics I', credits: 4, grade: 7, status: 'Graded' },
      { code: 'DatZ1010', name: 'Computer Architecture', credits: 4, grade: 8, status: 'Graded' },
      { code: 'MatZ1005', name: 'Discrete Mathematics', credits: 4, grade: 8, status: 'Graded' },
    ],
  },
];

function gradeColor(grade: number | null): string {
  if (grade === null) return 'text-text-secondary';
  if (grade >= 9) return 'text-green-600';
  if (grade >= 7) return 'text-blue-600';
  if (grade >= 5) return 'text-amber-600';
  return 'text-red-600';
}

export default function GradesPage() {
  const [expandedSemester, setExpandedSemester] = useState<string>('spring-2026');
  const cumulativeGPA = 7.84;
  const totalCredits = 78;

  return (
    <div className="bg-surface-bg min-h-screen">
      {/* Header */}
      <div className="bg-gradient-to-r from-rtu-green to-rtu-green-dark">
        <div className="rtu-container py-8">
          <h1 className="text-2xl font-bold text-white">Academic Record</h1>
          <p className="text-sm text-white/70">Computer Science BSc · Jānis Bērziņš</p>
        </div>
      </div>

      <div className="rtu-container py-6">
        {/* GPA Summary */}
        <div className="grid grid-cols-1 md:grid-cols-3 gap-4 mb-8">
          <div className="rtu-card text-center">
            <TrendingUp className="h-8 w-8 text-rtu-green mx-auto mb-2" />
            <p className="text-3xl font-extrabold text-text-primary">{cumulativeGPA}</p>
            <p className="text-sm text-text-secondary">Cumulative GPA</p>
            <p className="text-xs text-text-secondary mt-1">Scale: 1–10</p>
          </div>
          <div className="rtu-card text-center">
            <BookOpen className="h-8 w-8 text-rtu-green mx-auto mb-2" />
            <p className="text-3xl font-extrabold text-text-primary">{totalCredits}</p>
            <p className="text-sm text-text-secondary">Credits Earned</p>
            <p className="text-xs text-text-secondary mt-1">of 120 required</p>
          </div>
          <div className="rtu-card text-center">
            <Award className="h-8 w-8 text-rtu-green mx-auto mb-2" />
            <p className="text-3xl font-extrabold text-text-primary">65%</p>
            <p className="text-sm text-text-secondary">Degree Progress</p>
            <div className="h-2 bg-surface-bg rounded-full overflow-hidden mt-2">
              <div className="h-full bg-rtu-green rounded-full" style={{ width: '65%' }} />
            </div>
          </div>
        </div>

        {/* Semesters */}
        <div className="space-y-4">
          {semesters.map((sem) => {
            const isExpanded = expandedSemester === sem.id;
            return (
              <div key={sem.id} className="rtu-card">
                <button
                  onClick={() => setExpandedSemester(isExpanded ? '' : sem.id)}
                  className="w-full flex items-center justify-between"
                >
                  <div className="flex items-center gap-4">
                    <div>
                      <h3 className="font-bold text-text-primary text-left">{sem.name}</h3>
                      <p className="text-xs text-text-secondary">{sem.credits} credits · {sem.courses.length} courses</p>
                    </div>
                  </div>
                  <div className="flex items-center gap-4">
                    <div className="text-right">
                      <p className="text-lg font-bold text-rtu-green">{sem.gpa}</p>
                      <span className={`rtu-badge text-xs ${sem.status === 'Completed' ? 'bg-green-100 text-green-700' : 'bg-blue-100 text-blue-700'}`}>
                        {sem.status}
                      </span>
                    </div>
                    <ChevronDown className={`h-5 w-5 text-text-secondary transition-transform ${isExpanded ? 'rotate-180' : ''}`} />
                  </div>
                </button>

                {isExpanded && (
                  <div className="mt-4 border-t pt-4">
                    <div className="overflow-x-auto">
                      <table className="w-full text-sm">
                        <thead>
                          <tr className="text-left text-text-secondary border-b">
                            <th className="pb-2 font-medium">Code</th>
                            <th className="pb-2 font-medium">Course</th>
                            <th className="pb-2 font-medium text-center">Credits</th>
                            <th className="pb-2 font-medium text-center">Grade</th>
                            <th className="pb-2 font-medium text-right">Status</th>
                          </tr>
                        </thead>
                        <tbody>
                          {sem.courses.map((course) => (
                            <tr key={course.code} className="border-b border-gray-50 last:border-0">
                              <td className="py-3 font-mono text-xs text-text-secondary">{course.code}</td>
                              <td className="py-3 font-medium text-text-primary">{course.name}</td>
                              <td className="py-3 text-center text-text-secondary">{course.credits}</td>
                              <td className={`py-3 text-center font-bold text-lg ${gradeColor(course.grade)}`}>
                                {course.grade ?? '—'}
                              </td>
                              <td className="py-3 text-right">
                                <span className={`rtu-badge text-xs ${
                                  course.status === 'Graded' ? 'bg-green-100 text-green-700' : 'bg-amber-100 text-amber-700'
                                }`}>
                                  {course.status}
                                </span>
                              </td>
                            </tr>
                          ))}
                        </tbody>
                      </table>
                    </div>
                  </div>
                )}
              </div>
            );
          })}
        </div>
      </div>
    </div>
  );
}
