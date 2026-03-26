import Link from 'next/link';

const footerLinks = {
  University: [
    { label: 'About RTU', href: '/about' },
    { label: 'Faculties', href: '/faculties' },
    { label: 'Research', href: '/research' },
    { label: 'News', href: '/news' },
    { label: 'Events', href: '/events' },
  ],
  Admissions: [
    { label: 'Programs', href: '/admissions' },
    { label: 'How to Apply', href: '/admissions' },
    { label: 'Tuition & Fees', href: '/admissions' },
    { label: 'Scholarships', href: '/admissions' },
  ],
  Students: [
    { label: 'ORTUS Portal', href: '/portal' },
    { label: 'Schedule', href: '/portal/schedule' },
    { label: 'Grades', href: '/portal/grades' },
    { label: 'Library', href: '/portal' },
  ],
  Contact: [
    { label: 'Ķīpsalas iela 6A', href: '#' },
    { label: 'Rīga, LV-1048', href: '#' },
    { label: '+371 67089333', href: 'tel:+37167089333' },
    { label: 'info@rtu.lv', href: 'mailto:info@rtu.lv' },
  ],
};

export default function Footer() {
  return (
    <footer className="bg-rtu-green-dark text-white">
      <div className="rtu-container py-16">
        <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-5 gap-10">
          {/* Brand */}
          <div className="lg:col-span-1">
            <div className="flex items-center gap-3 mb-4">
              <div className="w-10 h-10 bg-white rounded-lg flex items-center justify-center">
                <span className="text-rtu-green font-black text-sm">RTU</span>
              </div>
              <div>
                <p className="text-sm font-bold leading-tight">Rīgas Tehniskā</p>
                <p className="text-sm font-bold leading-tight">universitāte</p>
              </div>
            </div>
            <p className="text-sm text-white/70 leading-relaxed">
              Leading technical university in the Baltics. Advancing science, technology, and innovation since 1862.
            </p>
          </div>

          {/* Links */}
          {Object.entries(footerLinks).map(([title, links]) => (
            <div key={title}>
              <h4 className="font-semibold text-sm mb-4 text-white/90">{title}</h4>
              <ul className="space-y-2">
                {links.map((link) => (
                  <li key={link.label}>
                    <Link
                      href={link.href}
                      className="text-sm text-white/60 hover:text-white transition-colors"
                    >
                      {link.label}
                    </Link>
                  </li>
                ))}
              </ul>
            </div>
          ))}
        </div>

        <div className="border-t border-white/10 mt-12 pt-8 flex flex-col md:flex-row justify-between items-center gap-4">
          <p className="text-sm text-white/50">
            © {new Date().getFullYear()} Riga Technical University. All rights reserved.
          </p>
          <div className="flex gap-6">
            <Link href="#" className="text-sm text-white/50 hover:text-white transition-colors">
              Privacy Policy
            </Link>
            <Link href="#" className="text-sm text-white/50 hover:text-white transition-colors">
              Terms of Use
            </Link>
            <Link href="#" className="text-sm text-white/50 hover:text-white transition-colors">
              Accessibility
            </Link>
          </div>
        </div>
      </div>
    </footer>
  );
}
