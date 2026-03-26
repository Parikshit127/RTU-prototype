'use client';

import { useState } from 'react';
import { Calendar, Clock, MapPin, ChevronLeft, ChevronRight } from 'lucide-react';

const days = ['Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday'];

const schedule: Record<string, { time: string; end: string; subject: string; code: string; room: string; type: string; professor: string }[]> = {
  Monday: [
    { time: '08:30', end: '10:00', subject: 'Data Structures & Algorithms', code: 'DatZ3001', room: 'Room 301', type: 'Lecture', professor: 'Prof. A. Kaļķis' },
    { time: '10:15', end: '11:45', subject: 'Linear Algebra', code: 'MatZ2001', room: 'Room 215', type: 'Lecture', professor: 'Prof. I. Ozoliņa' },
    { time: '13:00', end: '14:30', subject: 'Web Technologies Lab', code: 'DatZ3015', room: 'Lab 412', type: 'Lab', professor: 'Doc. K. Podnieks' },
    { time: '14:45', end: '16:15', subject: 'Physics II', code: 'FizZ1002', room: 'Room 102', type: 'Lecture', professor: 'Prof. R. Vītoliņš' },
  ],
  Tuesday: [
    { time: '08:30', end: '10:00', subject: 'Operating Systems', code: 'DatZ4020', room: 'Room 305', type: 'Lecture', professor: 'Prof. M. Liepiņš' },
    { time: '10:15', end: '11:45', subject: 'Probability & Statistics', code: 'MatZ2015', room: 'Room 210', type: 'Lecture', professor: 'Doc. V. Krūmiņa' },
    { time: '14:45', end: '16:15', subject: 'Data Structures Lab', code: 'DatZ3001', room: 'Lab 410', type: 'Lab', professor: 'Doc. J. Vītols' },
  ],
  Wednesday: [
    { time: '10:15', end: '11:45', subject: 'Computer Networks', code: 'DatZ4010', room: 'Room 303', type: 'Lecture', professor: 'Prof. G. Zaķis' },
    { time: '13:00', end: '14:30', subject: 'Discrete Mathematics', code: 'MatZ1005', room: 'Room 201', type: 'Lecture', professor: 'Prof. I. Ozoliņa' },
    { time: '14:45', end: '16:15', subject: 'English for Engineers', code: 'ValZ1001', room: 'Room 115', type: 'Seminar', professor: 'Lect. S. Jansone' },
  ],
  Thursday: [
    { time: '08:30', end: '10:00', subject: 'Web Technologies', code: 'DatZ3015', room: 'Room 301', type: 'Lecture', professor: 'Doc. K. Podnieks' },
    { time: '10:15', end: '11:45', subject: 'Physics II Lab', code: 'FizZ1002', room: 'Lab 104', type: 'Lab', professor: 'Doc. E. Liepa' },
    { time: '13:00', end: '14:30', subject: 'Operating Systems Lab', code: 'DatZ4020', room: 'Lab 408', type: 'Lab', professor: 'Doc. A. Kalniņš' },
  ],
  Friday: [
    { time: '10:15', end: '11:45', subject: 'Linear Algebra Practice', code: 'MatZ2001', room: 'Room 220', type: 'Seminar', professor: 'Doc. N. Petrova' },
    { time: '13:00', end: '14:30', subject: 'Computer Networks Lab', code: 'DatZ4010', room: 'Lab 411', type: 'Lab', professor: 'Doc. T. Ķēniņš' },
  ],
};

const typeColors: Record<string, string> = {
  Lecture: 'bg-blue-100 text-blue-700',
  Lab: 'bg-purple-100 text-purple-700',
  Seminar: 'bg-amber-100 text-amber-700',
};

export default function SchedulePage() {
  const [selectedDay, setSelectedDay] = useState(0);
  const daySchedule = schedule[days[selectedDay]] || [];

  return (
    <div className="bg-surface-bg min-h-screen">
      {/* Header */}
      <div className="bg-gradient-to-r from-rtu-green to-rtu-green-dark">
        <div className="rtu-container py-8">
          <h1 className="text-2xl font-bold text-white">Class Schedule</h1>
          <p className="text-sm text-white/70">Spring Semester 2026 · Week 12</p>
        </div>
      </div>

      <div className="rtu-container py-6">
        {/* Day Selector */}
        <div className="flex gap-2 mb-6 overflow-x-auto pb-2">
          {days.map((day, i) => (
            <button
              key={day}
              onClick={() => setSelectedDay(i)}
              className={`px-5 py-3 rounded-xl text-sm font-semibold whitespace-nowrap transition-colors ${
                i === selectedDay
                  ? 'bg-rtu-green text-white shadow-rtu'
                  : 'bg-white text-text-secondary hover:bg-rtu-green-tint hover:text-rtu-green'
              }`}
            >
              {day}
              <span className="ml-2 text-xs opacity-70">({(schedule[day] || []).length})</span>
            </button>
          ))}
        </div>

        {/* Classes */}
        {daySchedule.length > 0 ? (
          <div className="space-y-4">
            {daySchedule.map((cls) => (
              <div key={`${cls.time}-${cls.code}`} className="rtu-card">
                <div className="flex gap-4">
                  {/* Time */}
                  <div className="w-16 flex-shrink-0 text-center">
                    <p className="text-lg font-bold text-rtu-green">{cls.time}</p>
                    <p className="text-xs text-text-secondary">{cls.end}</p>
                    <div className="w-0.5 h-6 bg-rtu-green/20 mx-auto mt-2" />
                  </div>

                  {/* Content */}
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-1">
                      <span className={`rtu-badge ${typeColors[cls.type] || 'bg-gray-100 text-gray-700'}`}>
                        {cls.type}
                      </span>
                      <span className="text-xs text-text-secondary font-mono">{cls.code}</span>
                    </div>
                    <h3 className="font-bold text-text-primary mb-1">{cls.subject}</h3>
                    <div className="flex flex-wrap gap-4 text-sm text-text-secondary">
                      <span className="flex items-center gap-1">
                        <MapPin className="h-3.5 w-3.5" /> {cls.room}, Ķīpsala
                      </span>
                      <span className="flex items-center gap-1">
                        <Calendar className="h-3.5 w-3.5" /> {cls.professor}
                      </span>
                    </div>
                  </div>
                </div>
              </div>
            ))}
          </div>
        ) : (
          <div className="rtu-card text-center py-12">
            <Calendar className="h-12 w-12 text-text-secondary/30 mx-auto mb-3" />
            <p className="text-text-secondary font-medium">No classes scheduled</p>
            <p className="text-sm text-text-secondary mt-1">Enjoy your free day!</p>
          </div>
        )}

        {/* Week summary */}
        <div className="mt-8 rtu-card">
          <h3 className="font-bold text-text-primary mb-3">Week Summary</h3>
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="text-center">
              <p className="text-2xl font-bold text-text-primary">14</p>
              <p className="text-xs text-text-secondary">Total Classes</p>
            </div>
            <div className="text-center">
              <p className="text-2xl font-bold text-blue-600">7</p>
              <p className="text-xs text-text-secondary">Lectures</p>
            </div>
            <div className="text-center">
              <p className="text-2xl font-bold text-purple-600">5</p>
              <p className="text-xs text-text-secondary">Labs</p>
            </div>
            <div className="text-center">
              <p className="text-2xl font-bold text-amber-600">2</p>
              <p className="text-xs text-text-secondary">Seminars</p>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
