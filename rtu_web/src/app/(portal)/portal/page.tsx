'use client';

import { useState } from 'react';
import Link from 'next/link';
import {
  Calendar,
  BookOpen,
  CreditCard,
  Bell,
  User,
  Clock,
  TrendingUp,
  FileText,
  Library,
  MessageSquare,
  GraduationCap,
  ArrowRight,
  LogOut,
} from 'lucide-react';

// Mock student data (matches backend/Flutter)
const student = {
  name: 'Jānis Bērziņš',
  id: 'RTU-2024-1847',
  program: 'Computer Science BSc',
  faculty: 'FCSIE',
  semester: 'Spring 2026',
  gpa: 7.84,
  photo: null,
};

const quickActions = [
  { label: 'Schedule', icon: Calendar, href: '/portal/schedule', color: 'bg-blue-500' },
  { label: 'Grades', icon: BookOpen, href: '/portal/grades', color: 'bg-green-500' },
  { label: 'Fees', icon: CreditCard, href: '/portal/fees', color: 'bg-purple-500' },
  { label: 'Library', icon: Library, href: '#', color: 'bg-orange-500' },
  { label: 'Courses', icon: FileText, href: '#', color: 'bg-cyan-500' },
  { label: 'Messages', icon: MessageSquare, href: '#', color: 'bg-red-500' },
];

const todayClasses = [
  { time: '08:30', end: '10:00', subject: 'Data Structures & Algorithms', room: 'Room 301, Ķīpsala', type: 'Lecture' },
  { time: '10:15', end: '11:45', subject: 'Linear Algebra', room: 'Room 215, Ķīpsala', type: 'Lecture' },
  { time: '13:00', end: '14:30', subject: 'Web Technologies Lab', room: 'Lab 412, Ķīpsala', type: 'Lab' },
  { time: '14:45', end: '16:15', subject: 'Physics II', room: 'Room 102, Ķīpsala', type: 'Lecture' },
];

const notifications = [
  { text: 'Grade posted: DatZ3001 — Data Structures', time: '2 hours ago', unread: true },
  { text: 'Schedule change: Linear Algebra moved to Room 215', time: '5 hours ago', unread: true },
  { text: 'Tuition payment reminder — due March 31', time: '1 day ago', unread: false },
  { text: 'New course material uploaded: Web Technologies', time: '2 days ago', unread: false },
];

export default function PortalDashboard() {
  const [showLogin, setShowLogin] = useState(false);

  return (
    <div className="bg-surface-bg min-h-screen">
      {/* Portal Header */}
      <div className="bg-gradient-to-r from-rtu-green to-rtu-green-dark">
        <div className="rtu-container py-8">
          <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
            <div className="flex items-center gap-4">
              <div className="w-16 h-16 bg-white/10 rounded-2xl flex items-center justify-center">
                <GraduationCap className="h-8 w-8 text-white" />
              </div>
              <div>
                <p className="text-sm text-white/70">Welcome back</p>
                <h1 className="text-2xl font-bold text-white">{student.name}</h1>
                <p className="text-sm text-white/70">{student.id} · {student.program} · {student.faculty}</p>
              </div>
            </div>
            <div className="flex items-center gap-3">
              <div className="bg-white/10 rounded-xl px-4 py-2 text-center">
                <p className="text-xs text-white/60">Current GPA</p>
                <p className="text-xl font-bold text-white">{student.gpa}</p>
              </div>
              <div className="bg-white/10 rounded-xl px-4 py-2 text-center">
                <p className="text-xs text-white/60">Semester</p>
                <p className="text-sm font-bold text-white">{student.semester}</p>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div className="rtu-container py-8">
        <div className="grid grid-cols-1 lg:grid-cols-3 gap-6">
          {/* Main Content */}
          <div className="lg:col-span-2 space-y-6">
            {/* Quick Actions */}
            <div>
              <h2 className="text-lg font-bold text-text-primary mb-4">Quick Actions</h2>
              <div className="grid grid-cols-3 md:grid-cols-6 gap-3">
                {quickActions.map((action) => (
                  <Link
                    key={action.label}
                    href={action.href}
                    className="rtu-card flex flex-col items-center gap-2 py-4 hover:border-rtu-green"
                  >
                    <div className={`w-10 h-10 ${action.color} rounded-xl flex items-center justify-center`}>
                      <action.icon className="h-5 w-5 text-white" />
                    </div>
                    <span className="text-xs font-medium text-text-primary">{action.label}</span>
                  </Link>
                ))}
              </div>
            </div>

            {/* Today's Schedule */}
            <div>
              <div className="flex justify-between items-center mb-4">
                <h2 className="text-lg font-bold text-text-primary">Today&apos;s Schedule</h2>
                <Link href="/portal/schedule" className="text-rtu-green text-sm font-semibold hover:underline">
                  Full Schedule
                </Link>
              </div>
              <div className="space-y-3">
                {todayClasses.map((cls) => (
                  <div key={cls.time} className="rtu-card flex items-center gap-4">
                    <div className="w-16 text-center flex-shrink-0">
                      <p className="text-sm font-bold text-rtu-green">{cls.time}</p>
                      <p className="text-xs text-text-secondary">{cls.end}</p>
                    </div>
                    <div className="w-1 h-10 bg-rtu-green rounded-full flex-shrink-0" />
                    <div className="flex-1 min-w-0">
                      <p className="font-semibold text-text-primary text-sm truncate">{cls.subject}</p>
                      <p className="text-xs text-text-secondary">{cls.room}</p>
                    </div>
                    <span className={`rtu-badge text-xs ${cls.type === 'Lab' ? 'bg-purple-100 text-purple-700' : 'bg-blue-100 text-blue-700'}`}>
                      {cls.type}
                    </span>
                  </div>
                ))}
              </div>
            </div>
          </div>

          {/* Sidebar */}
          <div className="space-y-6">
            {/* Notifications */}
            <div>
              <h2 className="text-lg font-bold text-text-primary mb-4">Notifications</h2>
              <div className="space-y-3">
                {notifications.map((n, i) => (
                  <div key={i} className={`rtu-card ${n.unread ? 'border-l-4 border-l-rtu-green' : ''}`}>
                    <p className="text-sm text-text-primary leading-snug">{n.text}</p>
                    <p className="text-xs text-text-secondary mt-1">{n.time}</p>
                  </div>
                ))}
              </div>
            </div>

            {/* Quick Stats */}
            <div className="rtu-card">
              <h3 className="font-bold text-text-primary mb-4">Semester Progress</h3>
              <div className="space-y-3">
                <div>
                  <div className="flex justify-between text-sm mb-1">
                    <span className="text-text-secondary">Completed Credits</span>
                    <span className="font-semibold text-text-primary">78 / 120</span>
                  </div>
                  <div className="h-2 bg-surface-bg rounded-full overflow-hidden">
                    <div className="h-full bg-rtu-green rounded-full" style={{ width: '65%' }} />
                  </div>
                </div>
                <div>
                  <div className="flex justify-between text-sm mb-1">
                    <span className="text-text-secondary">Attendance</span>
                    <span className="font-semibold text-text-primary">92%</span>
                  </div>
                  <div className="h-2 bg-surface-bg rounded-full overflow-hidden">
                    <div className="h-full bg-green-500 rounded-full" style={{ width: '92%' }} />
                  </div>
                </div>
                <div>
                  <div className="flex justify-between text-sm mb-1">
                    <span className="text-text-secondary">Assignments Due</span>
                    <span className="font-semibold text-orange-600">3 pending</span>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
}
