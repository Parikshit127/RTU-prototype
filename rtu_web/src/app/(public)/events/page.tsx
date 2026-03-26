import { Calendar, MapPin, Clock, Users, ArrowRight, Filter } from 'lucide-react';
import Link from 'next/link';

const eventTypes = ['All', 'Academic', 'Research', 'Career', 'Student Life', 'Admissions'];

const events = [
  {
    id: 1,
    title: 'Open Day — Spring 2026',
    date: 'April 5, 2026',
    time: '10:00 – 16:00',
    location: 'Ķīpsala Campus, Main Building',
    type: 'Admissions',
    description: 'Explore all 8 faculties, attend demo lectures, meet professors and current students. Free registration required.',
    featured: true,
  },
  {
    id: 2,
    title: 'RTU Science & Innovation Conference 2026',
    date: 'April 12-14, 2026',
    time: '09:00 – 18:00',
    location: 'DITF Conference Center',
    type: 'Research',
    description: 'Annual research conference featuring 200+ presentations across engineering, technology, and applied sciences.',
    featured: false,
  },
  {
    id: 3,
    title: 'Career Fair: Tech & Engineering',
    date: 'April 19, 2026',
    time: '10:00 – 17:00',
    location: 'Ķīpsala Sports Hall',
    type: 'Career',
    description: 'Meet 60+ employers from top tech companies and engineering firms. Bring your CV — on-site interviews available.',
    featured: false,
  },
  {
    id: 4,
    title: 'Student Hackathon 2026',
    date: 'April 26-27, 2026',
    time: '48-hour event',
    location: 'DITF Innovation Hub',
    type: 'Student Life',
    description: 'Team up in groups of 3-5 and build solutions for real industry challenges. €5,000 prize pool. All skill levels welcome.',
    featured: false,
  },
  {
    id: 5,
    title: 'Guest Lecture: Future of Quantum Computing',
    date: 'May 3, 2026',
    time: '14:00 – 16:00',
    location: 'Auditorium 220, Building 1',
    type: 'Academic',
    description: 'Prof. Jānis Vīksne from MIT presents latest advances in quantum error correction and practical quantum algorithms.',
    featured: false,
  },
  {
    id: 6,
    title: 'International Student Cultural Festival',
    date: 'May 10, 2026',
    time: '12:00 – 20:00',
    location: 'Ķīpsala Outdoor Area',
    type: 'Student Life',
    description: 'Celebrating diversity with food, music, and performances from 40+ countries represented at RTU.',
    featured: false,
  },
  {
    id: 7,
    title: 'Master Thesis Defense Week',
    date: 'May 25-29, 2026',
    time: 'Various times',
    location: 'Faculty buildings',
    type: 'Academic',
    description: 'Public thesis defenses across all faculties. Visitors welcome to attend and learn about cutting-edge student research.',
    featured: false,
  },
];

export default function EventsPage() {
  const featured = events.find((e) => e.featured);
  const upcoming = events.filter((e) => !e.featured);

  return (
    <>
      {/* Hero */}
      <section className="bg-gradient-to-br from-rtu-green to-rtu-green-dark py-20">
        <div className="rtu-container">
          <span className="rtu-badge bg-white/10 text-white mb-4">Events</span>
          <h1 className="text-4xl md:text-5xl font-extrabold text-white mb-4">University Events</h1>
          <p className="text-lg text-white/80 max-w-2xl">
            Conferences, career fairs, hackathons, and cultural events — there&apos;s always something
            happening at RTU.
          </p>
        </div>
      </section>

      {/* Type Filter */}
      <section className="bg-white border-b sticky top-0 z-30">
        <div className="rtu-container py-4">
          <div className="flex gap-2 overflow-x-auto pb-1">
            {eventTypes.map((type) => (
              <button
                key={type}
                className={`px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap transition-colors ${
                  type === 'All'
                    ? 'bg-rtu-green text-white'
                    : 'bg-surface-bg text-text-secondary hover:bg-rtu-green-tint hover:text-rtu-green'
                }`}
              >
                {type}
              </button>
            ))}
          </div>
        </div>
      </section>

      {/* Featured Event */}
      {featured && (
        <section className="rtu-section bg-surface-bg pb-8">
          <div className="rtu-container">
            <div className="rtu-card overflow-hidden">
              <div className="grid grid-cols-1 md:grid-cols-5 gap-6">
                <div className="md:col-span-2 h-64 md:h-auto bg-gradient-to-br from-rtu-green to-rtu-green-dark rounded-lg flex flex-col items-center justify-center text-white p-6 text-center">
                  <Calendar className="h-12 w-12 mb-3 text-white/80" />
                  <p className="text-2xl font-extrabold">{featured.date}</p>
                  <p className="text-sm text-white/70 mt-1">{featured.time}</p>
                </div>
                <div className="md:col-span-3 flex flex-col justify-center py-2">
                  <span className="rtu-badge bg-rtu-green-tint text-rtu-green w-fit mb-3">{featured.type}</span>
                  <h2 className="text-2xl font-bold text-text-primary mb-3">{featured.title}</h2>
                  <p className="text-text-secondary leading-relaxed mb-4">{featured.description}</p>
                  <div className="flex flex-wrap gap-4 text-sm text-text-secondary mb-4">
                    <span className="flex items-center gap-1"><MapPin className="h-4 w-4" /> {featured.location}</span>
                    <span className="flex items-center gap-1"><Clock className="h-4 w-4" /> {featured.time}</span>
                  </div>
                  <button className="rtu-btn-primary w-fit">
                    Register Now <ArrowRight className="ml-2 h-4 w-4" />
                  </button>
                </div>
              </div>
            </div>
          </div>
        </section>
      )}

      {/* Events List */}
      <section className="rtu-section bg-surface-bg pt-0">
        <div className="rtu-container">
          <h2 className="text-2xl font-bold text-text-primary mb-6">Upcoming Events</h2>
          <div className="space-y-4">
            {upcoming.map((ev) => (
              <div key={ev.id} className="rtu-card group cursor-pointer">
                <div className="flex flex-col md:flex-row gap-6">
                  <div className="w-24 h-24 bg-rtu-green-tint rounded-xl flex flex-col items-center justify-center flex-shrink-0">
                    <Calendar className="h-6 w-6 text-rtu-green mb-1" />
                    <p className="text-xs font-bold text-rtu-green text-center leading-tight">
                      {ev.date.split(',')[0]}
                    </p>
                  </div>
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-1">
                      <span className="rtu-badge bg-rtu-green-tint text-rtu-green">{ev.type}</span>
                    </div>
                    <h3 className="font-bold text-text-primary group-hover:text-rtu-green transition-colors mb-1">
                      {ev.title}
                    </h3>
                    <p className="text-sm text-text-secondary leading-relaxed mb-2">{ev.description}</p>
                    <div className="flex flex-wrap gap-4 text-xs text-text-secondary">
                      <span className="flex items-center gap-1"><MapPin className="h-3 w-3" /> {ev.location}</span>
                      <span className="flex items-center gap-1"><Clock className="h-3 w-3" /> {ev.time}</span>
                    </div>
                  </div>
                  <div className="flex items-center">
                    <ArrowRight className="h-5 w-5 text-text-secondary group-hover:text-rtu-green transition-colors" />
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
