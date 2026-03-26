import Link from 'next/link';
import { Building2, Users, BookOpen, ArrowRight, FlaskConical } from 'lucide-react';

const faculties = [
  {
    abbr: 'FCSIE',
    name: 'Faculty of Computer Science, Information Technology and Energy',
    dean: 'Prof. Agris Ņikitenko',
    students: '3,200+',
    programs: 18,
    color: 'bg-blue-500',
    description:
      'Leading faculty in computer science, software engineering, data science, and energy systems. Home to cutting-edge AI and cybersecurity research labs.',
    highlights: ['Artificial Intelligence', 'Cybersecurity', 'Energy Systems', 'Data Science'],
  },
  {
    abbr: 'FETBE',
    name: 'Faculty of Electronics, Telecommunications and Biomedical Engineering',
    dean: 'Prof. Jurijs Dehtjars',
    students: '1,800+',
    programs: 12,
    color: 'bg-purple-500',
    description:
      'Advancing electronics, communications, and biomedical technologies. Strong industry partnerships with leading tech companies.',
    highlights: ['Biomedical Engineering', 'IoT & Sensors', 'Telecommunications', '5G Research'],
  },
  {
    abbr: 'FCME',
    name: 'Faculty of Civil and Mechanical Engineering',
    dean: 'Prof. Dmitrijs Serdjuks',
    students: '2,100+',
    programs: 14,
    color: 'bg-orange-500',
    description:
      'Teaching and researching sustainable construction, mechanical systems, and industrial engineering for over 100 years.',
    highlights: ['Sustainable Construction', 'Robotics', 'Aviation Engineering', 'Heat Engineering'],
  },
  {
    abbr: 'FEEE',
    name: 'Faculty of Electrical and Environmental Engineering',
    dean: 'Prof. Anatolijs Šarakovskis',
    students: '1,600+',
    programs: 11,
    color: 'bg-green-500',
    description:
      'Combining electrical engineering with environmental science to address climate and energy challenges.',
    highlights: ['Renewable Energy', 'Smart Grids', 'Environmental Tech', 'Power Electronics'],
  },
  {
    abbr: 'FMSAC',
    name: 'Faculty of Materials Science and Applied Chemistry',
    dean: 'Prof. Māris Turks',
    students: '1,100+',
    programs: 10,
    color: 'bg-red-500',
    description:
      'Pioneering materials research and chemical engineering with state-of-the-art labs in nanomaterials and polymer science.',
    highlights: ['Nanomaterials', 'Chemical Technology', 'Polymer Science', 'Drug Design'],
  },
  {
    abbr: 'FA',
    name: 'Faculty of Architecture',
    dean: 'Prof. Uģis Bratuškins',
    students: '800+',
    programs: 6,
    color: 'bg-yellow-500',
    description:
      'Blending design thinking with engineering precision. Known for urban planning research and sustainable architecture.',
    highlights: ['Urban Planning', 'Landscape Architecture', 'Interior Design', 'Heritage Conservation'],
  },
  {
    abbr: 'FEEM',
    name: 'Faculty of Engineering Economics and Management',
    dean: 'Prof. Elīna Gaile-Sarkane',
    students: '2,500+',
    programs: 15,
    color: 'bg-cyan-500',
    description:
      'Bridging engineering and business. Programs in innovation management, industrial engineering, and technology entrepreneurship.',
    highlights: ['Innovation Management', 'Entrepreneurship', 'Industrial Engineering', 'Logistics'],
  },
  {
    abbr: 'FETH',
    name: 'Faculty of E-Learning Technologies and Humanities',
    dean: 'Prof. Atis Kapenieks',
    students: '1,400+',
    programs: 9,
    color: 'bg-indigo-500',
    description:
      'Specializing in digital education, technical translation, and the intersection of technology and humanities.',
    highlights: ['E-Learning', 'Technical Translation', 'Digital Humanities', 'STEM Education'],
  },
];

export default function FacultiesPage() {
  return (
    <>
      {/* Hero */}
      <section className="bg-gradient-to-br from-rtu-green to-rtu-green-dark py-20">
        <div className="rtu-container">
          <span className="rtu-badge bg-white/10 text-white mb-4">Faculties</span>
          <h1 className="text-4xl md:text-5xl font-extrabold text-white mb-4">Our 8 Faculties</h1>
          <p className="text-lg text-white/80 max-w-2xl">
            From computer science to architecture, RTU&apos;s faculties cover the full spectrum of
            engineering and technical disciplines.
          </p>
        </div>
      </section>

      {/* Faculty Grid */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <div className="space-y-6">
            {faculties.map((fac) => (
              <div key={fac.abbr} className="rtu-card">
                <div className="flex flex-col lg:flex-row gap-6">
                  {/* Icon + Header */}
                  <div className="flex items-start gap-4 lg:w-1/3">
                    <div className={`w-14 h-14 ${fac.color} rounded-2xl flex items-center justify-center flex-shrink-0`}>
                      <Building2 className="h-7 w-7 text-white" />
                    </div>
                    <div>
                      <p className="text-xs font-bold text-text-secondary">{fac.abbr}</p>
                      <h3 className="font-bold text-text-primary leading-snug">{fac.name}</h3>
                      <p className="text-sm text-text-secondary mt-1">Dean: {fac.dean}</p>
                    </div>
                  </div>

                  {/* Description */}
                  <div className="lg:w-1/3">
                    <p className="text-sm text-text-secondary leading-relaxed">{fac.description}</p>
                    <div className="flex flex-wrap gap-2 mt-3">
                      {fac.highlights.map((h) => (
                        <span key={h} className="rtu-badge bg-rtu-green-tint text-rtu-green">{h}</span>
                      ))}
                    </div>
                  </div>

                  {/* Stats */}
                  <div className="lg:w-1/3 flex items-center justify-end gap-8">
                    <div className="text-center">
                      <Users className="h-5 w-5 text-rtu-green mx-auto mb-1" />
                      <p className="text-lg font-bold text-text-primary">{fac.students}</p>
                      <p className="text-xs text-text-secondary">Students</p>
                    </div>
                    <div className="text-center">
                      <BookOpen className="h-5 w-5 text-rtu-green mx-auto mb-1" />
                      <p className="text-lg font-bold text-text-primary">{fac.programs}</p>
                      <p className="text-xs text-text-secondary">Programs</p>
                    </div>
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
