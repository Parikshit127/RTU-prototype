// ═══════════════════════════════════════════════════════════════
// API Client — connects to the shared RTU backend
// ═══════════════════════════════════════════════════════════════
// Both the mobile app (Flutter) and this website hit the same API.
// In development, Next.js proxies /api/* to localhost:3001 via next.config.js
// ═══════════════════════════════════════════════════════════════

const API_BASE = process.env.NEXT_PUBLIC_API_URL || '/api';

async function fetchAPI<T>(endpoint: string): Promise<T> {
  const res = await fetch(`${API_BASE}${endpoint}`, {
    headers: { 'Content-Type': 'application/json' },
    next: { revalidate: 60 }, // ISR: revalidate every 60s
  });
  if (!res.ok) throw new Error(`API Error: ${res.status}`);
  return res.json();
}

// ── Public Website API ──
export const publicAPI = {
  getFaculties: () => fetchAPI<any[]>('/public/faculties'),
  getNews: () => fetchAPI<any[]>('/public/news'),
  getAdmissions: () => fetchAPI<any>('/public/admissions'),
  getResearch: () => fetchAPI<any[]>('/public/research'),
  getEvents: () => fetchAPI<any[]>('/events'),
};

// ── Student Portal API ──
export const portalAPI = {
  login: async (email: string, password: string) => {
    const res = await fetch(`${API_BASE}/auth/login`, {
      method: 'POST',
      headers: { 'Content-Type': 'application/json' },
      body: JSON.stringify({ email, password }),
    });
    return res.json();
  },
  getProfile: () => fetchAPI<any>('/student/profile'),
  getSchedule: () => fetchAPI<any>('/schedule'),
  getGrades: () => fetchAPI<any>('/grades'),
  getFees: () => fetchAPI<any>('/fees'),
  getNotifications: () => fetchAPI<any[]>('/notifications'),
};
