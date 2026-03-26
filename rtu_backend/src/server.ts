import express from 'express';
import cors from 'cors';
import helmet from 'helmet';
import morgan from 'morgan';
import dotenv from 'dotenv';

import { studentRoutes } from './routes/student';
import { scheduleRoutes } from './routes/schedule';
import { gradesRoutes } from './routes/grades';
import { eventsRoutes } from './routes/events';
import { feesRoutes } from './routes/fees';
import { coursesRoutes } from './routes/courses';
import { libraryRoutes } from './routes/library';
import { notificationsRoutes } from './routes/notifications';
import { publicRoutes } from './routes/public';
import { authRoutes } from './routes/auth';

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3001;

// ── Middleware ──
app.use(helmet());
app.use(cors({
  origin: [
    'http://localhost:3000',     // Next.js dev server
    'http://localhost:8080',     // Flutter web
    'http://10.0.2.2:3001',     // Android emulator
  ],
  credentials: true,
}));
app.use(morgan('dev'));
app.use(express.json());

// ── Health Check ──
app.get('/api/health', (req, res) => {
  res.json({
    status: 'ok',
    service: 'RTU Backend API',
    version: '1.0.0',
    timestamp: new Date().toISOString(),
  });
});

// ── API Routes ──
// Authentication
app.use('/api/auth', authRoutes);

// Student Portal (requires auth in production)
app.use('/api/student', studentRoutes);
app.use('/api/schedule', scheduleRoutes);
app.use('/api/grades', gradesRoutes);
app.use('/api/events', eventsRoutes);
app.use('/api/fees', feesRoutes);
app.use('/api/courses', coursesRoutes);
app.use('/api/library', libraryRoutes);
app.use('/api/notifications', notificationsRoutes);

// Public Website (no auth required)
app.use('/api/public', publicRoutes);

// ── 404 Handler ──
app.use((req, res) => {
  res.status(404).json({ error: 'Endpoint not found' });
});

// ── Start Server ──
app.listen(PORT, () => {
  console.log(`
  ╔═══════════════════════════════════════════════╗
  ║   RTU Backend API Server                      ║
  ║   Running on http://localhost:${PORT}            ║
  ║                                               ║
  ║   Endpoints:                                  ║
  ║   GET  /api/health           Health check     ║
  ║   POST /api/auth/login       Authentication   ║
  ║   GET  /api/student/profile  Student data     ║
  ║   GET  /api/schedule         Class timetable  ║
  ║   GET  /api/grades           Grade records    ║
  ║   GET  /api/events           University events║
  ║   GET  /api/fees             Fee invoices     ║
  ║   GET  /api/courses          Course catalog   ║
  ║   GET  /api/notifications    Notifications    ║
  ║   GET  /api/public/*         Public website   ║
  ╚═══════════════════════════════════════════════╝
  `);
});

export default app;
