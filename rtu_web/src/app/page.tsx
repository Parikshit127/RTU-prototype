import Link from 'next/link';
import {
  GraduationCap,
  Users,
  Globe,
  FlaskConical,
  BookOpen,
  Building2,
  ArrowRight,
  Calendar,
  Award,
  TrendingUp,
} from 'lucide-react';

// ── Stats ──
const stats = [
  { label: 'Students', value: '14,500+', icon: Users },
  { label: 'Programs', value: '120+', icon: BookOpen },
  { label: 'Research Projects', value: '400+', icon: FlaskConical },
  { label: 'International Partners', value: '350+', icon: Globe },
];

// ── Faculties ──
const faculties = [
  { name: 'Faculty of Computer Science, IT and Energy', abbr: 'FCSIE', color: 'bg-blue-500' },
  { name: 'Faculty of Electronics, Telecommunications and Biomedical Engineering', abbr: 'FETBE', color: 'bg-purple-500' },
  { name: 'Faculty of Civil and Mechanical Engineering', abbr: 'FCME', color: 'bg-orange-500' },
  { name: 'Faculty of Electrical and Environmental Engineering', abbr: 'FEEE', color: 'bg-green-500' },
  { name: 'Faculty of Materials Science and Applied Chemistry', abbr: 'FMSAC', color: 'bg-red-500' },
  { name: 'Faculty of Architecture', abbr: 'FA', color: 'bg-yellow-500' },
  { name: 'Faculty of Engineering Economics and Management', abbr: 'FEEM', color: 'bg-cyan-500' },
  { name: 'Faculty of E-Learning Technologies and Humanities', abbr: 'FETH', color: 'bg-indigo-500' },
];

// ── News (static for prototype) ──
const news = [
  {
    id: 1,
    title: 'RTU Researchers Develop New AI-Based Climate Modeling System',
    excerpt: 'A breakthrough in environmental computing from the Faculty of Computer Science.',
    date: 'Mar 20, 2026',
    category: 'Research',
  },
  {
    id: 2,
    title: 'Spring Semester International Student Welcome Day',
    excerpt: 'Over 200 new exchange students welcomed to Ķīpsala campus.',
    date: 'Mar 18, 2026',
    category: 'Campus Life',
  },
  {
    id: 3,
    title: 'RTU Climbs to Top 500 in QS World Rankings',
    excerpt: 'Significant improvement in research output and employer reputation metrics.',
    date: 'Mar 15, 2026',
    category: 'Achievement',
  },
];

// ── Upcoming Events ──
const events = [
  { title: 'Open Day — Spring 2026', date: 'Apr 5', type: 'Admissions' },
  { title: 'RTU Science & Innovation Conference', date: 'Apr 12', type: 'Research' },
  { title: 'Career Fair: Tech & Engineering', date: 'Apr 19', type: 'Career' },
  { title: 'Student Hackathon 2026', date: 'Apr 26', type: 'Student Life' },
];

export default function HomePage() {
  return (
    <>
      {/* ════════════════ HERO ════════════════ */}
      <section className="relative bg-gradient-to-br from-rtu-green via-rtu-green-dark to-rtu-green overflow-hidden">
        <div className="absolute inset-0 bg-[url('/grid.svg')] opacity-10" />
        <div className="rtu-container relative py-24 md:py-32 lg:py-40">
          <div className="max-w-3xl">
            <span className="inline-block px-4 py-1.5 bg-white/10 text-white/90 rounded-full text-sm font-medium mb-6 backdrop-blur-sm">
              #1 Technical University in Latvia
            </span>
            <h1 className="text-4xl md:text-5xl lg:text-6xl font-extrabold text-white leading-tight mb-6">
              Engineering the{' '}
              <span className="text-rtu-green-surface">Future</span>
              <br />
              Since 1862
            </h1>
            <p className="text-lg md:text-xl text-white/80 mb-10 max-w-2xl leading-relaxed">
              Riga Technical University is the oldest and largest technical university in the Baltic
              states, offering world-class education in engineering, technology, and natural sciences.
            </p>
            <div className="flex flex-wrap gap-4">
              <Link href="/admissions" className="rtu-btn-primary bg-white !text-rtu-green hover:bg-gray-100 text-base px-8 py-4">
                Apply Now <ArrowRight className="ml-2 h-5 w-5" />
              </Link>
              <Link href="/about" className="rtu-btn-outline !border-white !text-white hover:!bg-white/10 text-base px-8 py-4">
                Explore RTU
              </Link>
            </div>
          </div>
        </div>
      </section>

      {/* ════════════════ STATS BAR ════════════════ */}
      <section className="bg-white border-b">
        <div className="rtu-container py-10">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {stats.map((stat) => (
              <div key={stat.label} className="text-center">
                <stat.icon className="h-8 w-8 text-rtu-green mx-auto mb-3" />
                <p className="text-3xl font-extrabold text-text-primary">{stat.value}</p>
                <p className="text-sm text-text-secondary mt-1">{stat.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* ════════════════ FACULTIES ════════════════ */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <div className="flex justify-between items-end mb-10">
            <div>
              <h2 className="text-3xl font-bold text-text-primary">Our Faculties</h2>
              <p className="text-text-secondary mt-2">8 faculties offering 120+ study programs</p>
            </div>
            <Link href="/faculties" className="hidden md:flex items-center text-rtu-green font-semibold text-sm hover:underline">
              View All <ArrowRight className="ml-1 h-4 w-4" />
            </Link>
          </div>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-4">
            {faculties.map((fac) => (
              <Link
                key={fac.abbr}
                href="/faculties"
                className="rtu-card group flex items-start gap-4 hover:border-rtu-green"
              >
                <div className={`w-12 h-12 ${fac.color} rounded-xl flex items-center justify-center flex-shrink-0`}>
                  <Building2 className="h-6 w-6 text-white" />
                </div>
                <div>
                  <p className="text-xs font-bold text-text-secondary mb-1">{fac.abbr}</p>
                  <p className="text-sm font-semibold text-text-primary leading-snug group-hover:text-rtu-green transition-colors">
                    {fac.name}
                  </p>
                </div>
              </Link>
            ))}
          </div>
          <div className="md:hidden mt-6 text-center">
            <Link href="/faculties" className="text-rtu-green font-semibold text-sm hover:underline">
              View All Faculties <ArrowRight className="inline ml-1 h-4 w-4" />
            </Link>
          </div>
        </div>
      </section>

      {/* ════════════════ NEWS ════════════════ */}
      <section className="rtu-section bg-white">
        <div className="rtu-container">
          <div className="flex justify-between items-end mb-10">
            <div>
              <h2 className="text-3xl font-bold text-text-primary">Latest News</h2>
              <p className="text-text-secondary mt-2">Stay updated with what&#39;s happening at RTU</p>
            </div>
            <Link href="/news" className="hidden md:flex items-center text-rtu-green font-semibold text-sm hover:underline">
              All News <ArrowRight className="ml-1 h-4 w-4" />
            </Link>
          </div>
          <div className="grid grid-cols-1 md:grid-cols-3 gap-6">
            {news.map((item) => (
              <article key={item.id} className="rtu-card group cursor-pointer">
                <div className="h-48 bg-gradient-to-br from-rtu-green-surface to-surface-bg rounded-lg mb-4 flex items-center justify-center">
                  <BookOpen className="h-12 w-12 text-rtu-green/30" />
                </div>
                <div className="flex items-center gap-2 mb-2">
                  <span className="rtu-badge bg-rtu-green-tint text-rtu-green">{item.category}</span>
                  <span className="text-xs text-text-secondary">{item.date}</span>
                </div>
                <h3 className="font-semibold text-text-primary group-hover:text-rtu-green transition-colors mb-2 leading-snug">
                  {item.title}
                </h3>
                <p className="text-sm text-text-secondary leading-relaxed">{item.excerpt}</p>
              </article>
            ))}
          </div>
        </div>
      </section>

      {/* ════════════════ EVENTS + CTA ════════════════ */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <div className="grid grid-cols-1 lg:grid-cols-2 gap-12">
            {/* Events */}
            <div>
              <div className="flex justify-between items-end mb-6">
                <h2 className="text-2xl font-bold text-text-primary">Upcoming Events</h2>
                <Link href="/events" className="text-rtu-green font-semibold text-sm hover:underline">
                  All Events
                </Link>
              </div>
              <div className="space-y-3">
                {events.map((ev) => (
                  <div key={ev.title} className="rtu-card flex items-center gap-4">
                    <div className="w-14 h-14 bg-rtu-green-tint rounded-xl flex flex-col items-center justify-center flex-shrink-0">
                      <Calendar className="h-5 w-5 text-rtu-green" />
                    </div>
                    <div className="flex-1 min-w-0">
                      <p className="font-semibold text-text-primary text-sm truncate">{ev.title}</p>
                      <p className="text-xs text-text-secondary mt-0.5">{ev.date} · {ev.type}</p>
                    </div>
                    <ArrowRight className="h-4 w-4 text-text-secondary flex-shrink-0" />
                  </div>
                ))}
              </div>
            </div>

            {/* CTA Card */}
            <div className="flex flex-col justify-center">
              <div className="bg-gradient-to-br from-rtu-green to-rtu-green-dark rounded-2xl p-10 text-white">
                <Award className="h-12 w-12 mb-4 text-white/80" />
                <h3 className="text-2xl font-bold mb-3">Ready to Start Your Journey?</h3>
                <p className="text-white/80 leading-relaxed mb-6">
                  Join over 14,500 students from 60+ countries. Apply for the 2026/2027 academic year
                  and become part of Latvia&apos;s leading technical university.
                </p>
                <div className="flex flex-wrap gap-3">
                  <Link href="/admissions" className="inline-flex items-center px-6 py-3 bg-white text-rtu-green font-semibold rounded-lg hover:bg-gray-100 transition-colors">
                    Apply Now
                  </Link>
                  <Link href="/about" className="inline-flex items-center px-6 py-3 border-2 border-white/30 text-white font-semibold rounded-lg hover:bg-white/10 transition-colors">
                    Learn More
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </div>
      </section>

      {/* ════════════════ STUDENT PORTAL BANNER ════════════════ */}
      <section className="bg-white border-t">
        <div className="rtu-container py-12">
          <div className="flex flex-col md:flex-row items-center justify-between gap-6">
            <div className="flex items-center gap-4">
              <div className="w-14 h-14 bg-rtu-green-tint rounded-2xl flex items-center justify-center">
                <GraduationCap className="h-7 w-7 text-rtu-green" />
              </div>
              <div>
                <h3 className="text-lg font-bold text-text-primary">ORTUS Student Portal</h3>
                <p className="text-sm text-text-secondary">Access your schedule, grades, and university services</p>
              </div>
            </div>
            <Link href="/portal" className="rtu-btn-primary">
              Go to Portal <ArrowRight className="ml-2 h-4 w-4" />
            </Link>
          </div>
        </div>
      </section>
    </>
  );
}
