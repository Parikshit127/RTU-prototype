import { BookOpen, Search, ArrowRight } from 'lucide-react';
import Link from 'next/link';

const categories = ['All', 'Research', 'Campus Life', 'Achievement', 'Events', 'International'];

const newsItems = [
  {
    id: 1,
    title: 'RTU Researchers Develop New AI-Based Climate Modeling System',
    excerpt: 'A team from the Faculty of Computer Science has created an AI system capable of predicting micro-climate patterns in urban areas with 94% accuracy.',
    date: 'Mar 20, 2026',
    category: 'Research',
    featured: true,
  },
  {
    id: 2,
    title: 'Spring Semester International Student Welcome Day',
    excerpt: 'Over 200 new exchange students from 40 countries were welcomed to the Ķīpsala campus during the traditional welcome ceremony.',
    date: 'Mar 18, 2026',
    category: 'Campus Life',
    featured: false,
  },
  {
    id: 3,
    title: 'RTU Climbs to Top 500 in QS World University Rankings',
    excerpt: 'Significant improvement in research output and employer reputation metrics places RTU among the top technical universities in Eastern Europe.',
    date: 'Mar 15, 2026',
    category: 'Achievement',
    featured: false,
  },
  {
    id: 4,
    title: 'New €15M Research Center for Sustainable Materials Opens',
    excerpt: 'The state-of-the-art facility on Ķīpsala will host 120 researchers working on next-generation construction materials.',
    date: 'Mar 12, 2026',
    category: 'Research',
    featured: false,
  },
  {
    id: 5,
    title: 'RTU Student Team Wins European Robotics Challenge',
    excerpt: 'Five mechanical engineering students developed an autonomous warehouse robot that outperformed 45 teams from across Europe.',
    date: 'Mar 8, 2026',
    category: 'Achievement',
    featured: false,
  },
  {
    id: 6,
    title: 'Partnership with TalTech and KTH for Baltic Innovation Hub',
    excerpt: 'RTU joins forces with Estonian and Swedish universities to create a trilateral research and innovation corridor.',
    date: 'Mar 5, 2026',
    category: 'International',
    featured: false,
  },
  {
    id: 7,
    title: 'Annual Open Day Draws 5,000 Prospective Students',
    excerpt: 'Prospective students and parents explored all 8 faculties, attended demo lectures, and toured the newly renovated labs.',
    date: 'Mar 1, 2026',
    category: 'Events',
    featured: false,
  },
  {
    id: 8,
    title: 'Faculty of Architecture Wins International Design Award',
    excerpt: 'Prof. Bratuškins and students received the Baltic Architecture Prize for their sustainable housing concept.',
    date: 'Feb 26, 2026',
    category: 'Achievement',
    featured: false,
  },
];

export default function NewsPage() {
  const featured = newsItems.find((n) => n.featured);
  const rest = newsItems.filter((n) => !n.featured);

  return (
    <>
      {/* Hero */}
      <section className="bg-gradient-to-br from-rtu-green to-rtu-green-dark py-20">
        <div className="rtu-container">
          <span className="rtu-badge bg-white/10 text-white mb-4">News</span>
          <h1 className="text-4xl md:text-5xl font-extrabold text-white mb-4">University News</h1>
          <p className="text-lg text-white/80 max-w-2xl">
            Stay informed about the latest research breakthroughs, campus events, and achievements
            at Riga Technical University.
          </p>
        </div>
      </section>

      {/* Category Filter */}
      <section className="bg-white border-b sticky top-0 z-30">
        <div className="rtu-container py-4">
          <div className="flex gap-2 overflow-x-auto pb-1">
            {categories.map((cat) => (
              <button
                key={cat}
                className={`px-4 py-2 rounded-full text-sm font-medium whitespace-nowrap transition-colors ${
                  cat === 'All'
                    ? 'bg-rtu-green text-white'
                    : 'bg-surface-bg text-text-secondary hover:bg-rtu-green-tint hover:text-rtu-green'
                }`}
              >
                {cat}
              </button>
            ))}
          </div>
        </div>
      </section>

      {/* Featured Article */}
      {featured && (
        <section className="rtu-section bg-surface-bg pb-8">
          <div className="rtu-container">
            <div className="rtu-card overflow-hidden">
              <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
                <div className="h-64 md:h-auto bg-gradient-to-br from-rtu-green-surface to-surface-bg rounded-lg flex items-center justify-center">
                  <BookOpen className="h-16 w-16 text-rtu-green/20" />
                </div>
                <div className="flex flex-col justify-center py-4">
                  <div className="flex items-center gap-2 mb-3">
                    <span className="rtu-badge bg-rtu-green text-white">Featured</span>
                    <span className="rtu-badge bg-rtu-green-tint text-rtu-green">{featured.category}</span>
                    <span className="text-xs text-text-secondary">{featured.date}</span>
                  </div>
                  <h2 className="text-2xl font-bold text-text-primary mb-3">{featured.title}</h2>
                  <p className="text-text-secondary leading-relaxed mb-4">{featured.excerpt}</p>
                  <Link href="#" className="text-rtu-green font-semibold text-sm hover:underline inline-flex items-center">
                    Read Full Article <ArrowRight className="ml-1 h-4 w-4" />
                  </Link>
                </div>
              </div>
            </div>
          </div>
        </section>
      )}

      {/* News Grid */}
      <section className="rtu-section bg-surface-bg pt-0">
        <div className="rtu-container">
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {rest.map((item) => (
              <article key={item.id} className="rtu-card group cursor-pointer">
                <div className="h-40 bg-gradient-to-br from-rtu-green-surface to-surface-bg rounded-lg mb-4 flex items-center justify-center">
                  <BookOpen className="h-10 w-10 text-rtu-green/20" />
                </div>
                <div className="flex items-center gap-2 mb-2">
                  <span className="rtu-badge bg-rtu-green-tint text-rtu-green">{item.category}</span>
                  <span className="text-xs text-text-secondary">{item.date}</span>
                </div>
                <h3 className="font-semibold text-text-primary group-hover:text-rtu-green transition-colors mb-2 leading-snug">
                  {item.title}
                </h3>
                <p className="text-sm text-text-secondary leading-relaxed line-clamp-2">{item.excerpt}</p>
              </article>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
