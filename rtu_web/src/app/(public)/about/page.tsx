import { Award, Users, Globe, BookOpen, MapPin, Calendar } from 'lucide-react';

const timeline = [
  { year: '1862', event: 'Founded as Riga Polytechnicum' },
  { year: '1896', event: 'Renamed to Riga Polytechnic Institute' },
  { year: '1958', event: 'Becomes Riga Polytechnic Institute again after WWII' },
  { year: '1990', event: 'Restored as Riga Technical University' },
  { year: '2000', event: 'Bologna Process adoption, international expansion' },
  { year: '2019', event: 'New DITF building opens on Ķīpsala' },
  { year: '2026', event: 'Leading digital transformation in Baltic higher education' },
];

const leadership = [
  { name: 'Prof. Tālis Juhna', role: 'Rector', department: 'Office of the Rector' },
  { name: 'Prof. Uldis Sukovskis', role: 'Vice-Rector for Academic Affairs', department: 'Academic Division' },
  { name: 'Prof. Tālis Tisenkopfs', role: 'Vice-Rector for Research', department: 'Research Division' },
  { name: 'Māris Gailis', role: 'Director of Administration', department: 'Administrative Division' },
];

export default function AboutPage() {
  return (
    <>
      {/* Hero */}
      <section className="bg-gradient-to-br from-rtu-green to-rtu-green-dark py-20">
        <div className="rtu-container">
          <span className="rtu-badge bg-white/10 text-white mb-4">About RTU</span>
          <h1 className="text-4xl md:text-5xl font-extrabold text-white mb-4">
            Latvia&apos;s Leading Technical University
          </h1>
          <p className="text-lg text-white/80 max-w-2xl">
            For over 160 years, Riga Technical University has been at the forefront of engineering
            education and scientific research in the Baltic region.
          </p>
        </div>
      </section>

      {/* Mission & Vision */}
      <section className="rtu-section bg-white">
        <div className="rtu-container">
          <div className="grid grid-cols-1 md:grid-cols-2 gap-12">
            <div>
              <h2 className="text-2xl font-bold text-text-primary mb-4">Our Mission</h2>
              <p className="text-text-secondary leading-relaxed">
                To ensure internationally competitive, high-quality science-based study process and
                develop scientific research, innovation, and a creative environment for the development
                of Latvia&apos;s economy and society.
              </p>
            </div>
            <div>
              <h2 className="text-2xl font-bold text-text-primary mb-4">Our Vision</h2>
              <p className="text-text-secondary leading-relaxed">
                To be a modern, prestigious, internationally recognized university that is among the
                leading technical universities in Northern Europe and the Baltic Sea region.
              </p>
            </div>
          </div>
        </div>
      </section>

      {/* Key Stats */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">RTU at a Glance</h2>
          <div className="grid grid-cols-2 md:grid-cols-3 lg:grid-cols-6 gap-6">
            {[
              { icon: Users, value: '14,500+', label: 'Students' },
              { icon: Globe, value: '60+', label: 'Countries' },
              { icon: BookOpen, value: '120+', label: 'Programs' },
              { icon: Award, value: 'Top 500', label: 'QS Ranking' },
              { icon: Calendar, value: '160+', label: 'Years' },
              { icon: MapPin, value: '4', label: 'Campuses' },
            ].map((s) => (
              <div key={s.label} className="rtu-card text-center">
                <s.icon className="h-8 w-8 text-rtu-green mx-auto mb-3" />
                <p className="text-2xl font-extrabold text-text-primary">{s.value}</p>
                <p className="text-xs text-text-secondary mt-1">{s.label}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Timeline */}
      <section className="rtu-section bg-white">
        <div className="rtu-container max-w-3xl">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">Our History</h2>
          <div className="space-y-6">
            {timeline.map((item, i) => (
              <div key={item.year} className="flex gap-6">
                <div className="flex flex-col items-center">
                  <div className="w-12 h-12 rounded-full bg-rtu-green flex items-center justify-center flex-shrink-0">
                    <span className="text-white text-xs font-bold">{item.year}</span>
                  </div>
                  {i < timeline.length - 1 && <div className="w-0.5 h-full bg-rtu-green/20 mt-2" />}
                </div>
                <div className="pb-6">
                  <p className="font-semibold text-text-primary">{item.event}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Leadership */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">University Leadership</h2>
          <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-4 gap-6">
            {leadership.map((person) => (
              <div key={person.name} className="rtu-card text-center">
                <div className="w-20 h-20 bg-rtu-green-tint rounded-full mx-auto mb-4 flex items-center justify-center">
                  <Users className="h-8 w-8 text-rtu-green" />
                </div>
                <h3 className="font-semibold text-text-primary">{person.name}</h3>
                <p className="text-sm text-rtu-green font-medium mt-1">{person.role}</p>
                <p className="text-xs text-text-secondary mt-1">{person.department}</p>
              </div>
            ))}
          </div>
        </div>
      </section>
    </>
  );
}
