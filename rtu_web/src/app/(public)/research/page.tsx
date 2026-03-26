import { FlaskConical, TrendingUp, Users, FileText, Award, Globe, ArrowRight } from 'lucide-react';
import Link from 'next/link';

const researchAreas = [
  {
    title: 'Smart Materials & Nanotechnology',
    description: 'Developing next-generation materials with programmable properties for construction, medicine, and electronics.',
    icon: FlaskConical,
    stats: '45 active projects',
    color: 'bg-blue-500',
  },
  {
    title: 'Artificial Intelligence & Machine Learning',
    description: 'Advancing natural language processing, computer vision, and autonomous systems for industry applications.',
    icon: TrendingUp,
    stats: '38 active projects',
    color: 'bg-purple-500',
  },
  {
    title: 'Sustainable Energy Systems',
    description: 'Researching renewable energy integration, smart grids, and hydrogen economy technologies.',
    icon: Globe,
    stats: '52 active projects',
    color: 'bg-green-500',
  },
  {
    title: 'Biomedical Engineering',
    description: 'Creating innovative medical devices, biosensors, and biomaterials for improved healthcare.',
    icon: Award,
    stats: '28 active projects',
    color: 'bg-red-500',
  },
];

const highlights = [
  {
    title: 'Climate Modeling AI System',
    faculty: 'Faculty of Computer Science, IT and Energy',
    desc: 'A breakthrough AI system that predicts regional climate patterns with unprecedented accuracy, enabling better urban planning.',
    date: 'Mar 2026',
  },
  {
    title: 'Self-Healing Concrete Development',
    faculty: 'Faculty of Civil and Mechanical Engineering',
    desc: 'Bio-concrete with bacteria-based self-healing properties that could reduce infrastructure maintenance costs by 40%.',
    date: 'Feb 2026',
  },
  {
    title: 'Baltic Sea Environmental Monitoring Platform',
    faculty: 'Faculty of Electrical and Environmental Engineering',
    desc: 'IoT-based real-time monitoring network across the Baltic Sea tracking water quality and marine biodiversity.',
    date: 'Jan 2026',
  },
  {
    title: 'Novel Polymer Composite for Aviation',
    faculty: 'Faculty of Materials Science and Applied Chemistry',
    desc: 'Lightweight, fire-resistant polymer composite that reduces aircraft component weight by 30% while improving durability.',
    date: 'Dec 2025',
  },
];

export default function ResearchPage() {
  return (
    <>
      {/* Hero */}
      <section className="bg-gradient-to-br from-rtu-green to-rtu-green-dark py-20">
        <div className="rtu-container">
          <span className="rtu-badge bg-white/10 text-white mb-4">Research & Innovation</span>
          <h1 className="text-4xl md:text-5xl font-extrabold text-white mb-4">
            Driving Innovation Forward
          </h1>
          <p className="text-lg text-white/80 max-w-2xl">
            RTU researchers are solving the world&apos;s most pressing challenges — from climate
            change to healthcare — through interdisciplinary collaboration and cutting-edge technology.
          </p>
        </div>
      </section>

      {/* Stats */}
      <section className="bg-white border-b">
        <div className="rtu-container py-10">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-8">
            {[
              { value: '400+', label: 'Active Projects' },
              { value: '€12M', label: 'Annual Research Funding' },
              { value: '1,200+', label: 'Publications / Year' },
              { value: '85+', label: 'Research Labs' },
            ].map((s) => (
              <div key={s.label} className="text-center">
                <p className="text-3xl font-extrabold text-text-primary">{s.value}</p>
                <p className="text-sm text-text-secondary mt-1">{s.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Focus Areas */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">Key Research Areas</h2>
          <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
            {researchAreas.map((area) => (
              <div key={area.title} className="rtu-card">
                <div className="flex items-start gap-4">
                  <div className={`w-12 h-12 ${area.color} rounded-xl flex items-center justify-center flex-shrink-0`}>
                    <area.icon className="h-6 w-6 text-white" />
                  </div>
                  <div>
                    <h3 className="font-bold text-text-primary mb-1">{area.title}</h3>
                    <p className="text-sm text-text-secondary leading-relaxed mb-2">{area.description}</p>
                    <span className="text-xs font-semibold text-rtu-green">{area.stats}</span>
                  </div>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Recent Highlights */}
      <section className="rtu-section bg-white">
        <div className="rtu-container">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">Recent Highlights</h2>
          <div className="space-y-6">
            {highlights.map((h) => (
              <div key={h.title} className="rtu-card">
                <div className="flex flex-col md:flex-row md:items-center justify-between gap-4">
                  <div>
                    <p className="text-xs text-text-secondary mb-1">{h.date} · {h.faculty}</p>
                    <h3 className="font-bold text-text-primary mb-1">{h.title}</h3>
                    <p className="text-sm text-text-secondary leading-relaxed">{h.desc}</p>
                  </div>
                  <ArrowRight className="h-5 w-5 text-text-secondary flex-shrink-0" />
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
