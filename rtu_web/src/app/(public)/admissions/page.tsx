import Link from 'next/link';
import {
  FileText,
  CheckCircle2,
  ArrowRight,
  GraduationCap,
  Clock,
  Globe,
  Euro,
  Calendar,
  Users,
} from 'lucide-react';

const steps = [
  { step: 1, title: 'Choose Your Program', desc: 'Browse 120+ Bachelor, Master, and Doctoral programs across 8 faculties.' },
  { step: 2, title: 'Prepare Documents', desc: 'Gather transcripts, language certificates (IELTS/TOEFL), passport, and motivation letter.' },
  { step: 3, title: 'Submit Application', desc: 'Apply online through the RTU admissions portal. Application fee: €150 (non-refundable).' },
  { step: 4, title: 'Entrance Examination', desc: 'Some programs require entrance exams or portfolio review. Check specific requirements.' },
  { step: 5, title: 'Receive Decision', desc: 'Decisions are typically sent within 4-6 weeks of application deadline.' },
  { step: 6, title: 'Enroll & Register', desc: 'Accept your offer, pay tuition deposit, and register for your first semester.' },
];

const tuition = [
  { level: 'Bachelor Programs', fee: '€2,200 – €4,600 / year', duration: '3-4 years' },
  { level: 'Master Programs', fee: '€3,400 – €5,400 / year', duration: '1.5-2 years' },
  { level: 'Doctoral Programs', fee: '€4,800 – €7,200 / year', duration: '3-4 years' },
];

const deadlines = [
  { intake: 'Autumn Semester 2026', deadline: 'July 15, 2026', status: 'Open' },
  { intake: 'Spring Semester 2027', deadline: 'November 30, 2026', status: 'Upcoming' },
];

export default function AdmissionsPage() {
  return (
    <>
      {/* Hero */}
      <section className="bg-gradient-to-br from-rtu-green to-rtu-green-dark py-20">
        <div className="rtu-container">
          <span className="rtu-badge bg-white/10 text-white mb-4">Admissions</span>
          <h1 className="text-4xl md:text-5xl font-extrabold text-white mb-4">
            Begin Your Future at RTU
          </h1>
          <p className="text-lg text-white/80 max-w-2xl mb-8">
            Join 14,500+ students from 60+ countries at Latvia&apos;s top technical university.
            Applications for Autumn 2026 are now open.
          </p>
          <div className="flex flex-wrap gap-4">
            <Link href="#apply" className="inline-flex items-center px-8 py-4 bg-white text-rtu-green font-semibold rounded-lg hover:bg-gray-100 transition-colors">
              Apply Now <ArrowRight className="ml-2 h-5 w-5" />
            </Link>
            <Link href="#programs" className="inline-flex items-center px-8 py-4 border-2 border-white/30 text-white font-semibold rounded-lg hover:bg-white/10 transition-colors">
              Browse Programs
            </Link>
          </div>
        </div>
      </section>

      {/* Quick Stats */}
      <section className="bg-white border-b">
        <div className="rtu-container py-8">
          <div className="grid grid-cols-2 md:grid-cols-4 gap-6">
            {[
              { icon: GraduationCap, value: '120+', label: 'Study Programs' },
              { icon: Globe, value: '60+', label: 'Nationalities' },
              { icon: Euro, value: 'From €2,200', label: 'Annual Tuition' },
              { icon: Clock, value: 'Jul 15', label: 'Next Deadline' },
            ].map((s) => (
              <div key={s.label} className="flex items-center gap-3">
                <s.icon className="h-8 w-8 text-rtu-green flex-shrink-0" />
                <div>
                  <p className="text-xl font-bold text-text-primary">{s.value}</p>
                  <p className="text-xs text-text-secondary">{s.label}</p>
                </div>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* How to Apply */}
      <section id="apply" className="rtu-section bg-surface-bg">
        <div className="rtu-container">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-4">How to Apply</h2>
          <p className="text-text-secondary text-center mb-12 max-w-xl mx-auto">
            Follow these six steps to join the RTU community.
          </p>
          <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
            {steps.map((s) => (
              <div key={s.step} className="rtu-card">
                <div className="flex items-center gap-3 mb-3">
                  <div className="w-10 h-10 bg-rtu-green rounded-xl flex items-center justify-center">
                    <span className="text-white font-bold text-sm">{s.step}</span>
                  </div>
                  <h3 className="font-semibold text-text-primary">{s.title}</h3>
                </div>
                <p className="text-sm text-text-secondary leading-relaxed">{s.desc}</p>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Tuition & Fees */}
      <section className="rtu-section bg-white">
        <div className="rtu-container max-w-4xl">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">Tuition & Fees</h2>
          <div className="space-y-4">
            {tuition.map((t) => (
              <div key={t.level} className="rtu-card flex flex-col sm:flex-row sm:items-center justify-between gap-4">
                <div className="flex items-center gap-4">
                  <GraduationCap className="h-6 w-6 text-rtu-green flex-shrink-0" />
                  <div>
                    <p className="font-semibold text-text-primary">{t.level}</p>
                    <p className="text-xs text-text-secondary">Duration: {t.duration}</p>
                  </div>
                </div>
                <p className="text-lg font-bold text-rtu-green">{t.fee}</p>
              </div>
            ))}
          </div>
          <p className="text-xs text-text-secondary text-center mt-6">
            * Tuition fees vary by program and student nationality. EU/EEA citizens may be eligible for state-funded places.
          </p>
        </div>
      </section>

      {/* Deadlines */}
      <section className="rtu-section bg-surface-bg">
        <div className="rtu-container max-w-3xl">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">Application Deadlines</h2>
          <div className="space-y-4">
            {deadlines.map((d) => (
              <div key={d.intake} className="rtu-card flex items-center justify-between">
                <div className="flex items-center gap-4">
                  <Calendar className="h-6 w-6 text-rtu-green" />
                  <div>
                    <p className="font-semibold text-text-primary">{d.intake}</p>
                    <p className="text-sm text-text-secondary">Deadline: {d.deadline}</p>
                  </div>
                </div>
                <span className={`rtu-badge ${d.status === 'Open' ? 'bg-green-100 text-green-700' : 'bg-yellow-100 text-yellow-700'}`}>
                  {d.status}
                </span>
              </div>
            ))}
          </div>
        </div>
      </section>

      {/* Required Documents */}
      <section className="rtu-section bg-white">
        <div className="rtu-container max-w-3xl">
          <h2 className="text-3xl font-bold text-text-primary text-center mb-12">Required Documents</h2>
          <div className="rtu-card">
            <ul className="space-y-3">
              {[
                'Completed online application form',
                'Copy of passport or national ID',
                'Secondary school or previous degree transcripts (certified translation)',
                'English language proficiency certificate (IELTS 6.0+ or TOEFL 80+)',
                'Motivation letter / statement of purpose',
                'CV / Curriculum Vitae',
                'Two academic reference letters (for Master/Doctoral programs)',
                'Portfolio (for Architecture programs)',
              ].map((doc) => (
                <li key={doc} className="flex items-start gap-3">
                  <CheckCircle2 className="h-5 w-5 text-rtu-green flex-shrink-0 mt-0.5" />
                  <span className="text-sm text-text-primary">{doc}</span>
                </li>
              ))}
            </ul>
          </div>
        </div>
      </section>
    </>
  );
}
