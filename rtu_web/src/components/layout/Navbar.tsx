'use client';

import { useState } from 'react';
import Link from 'next/link';
import { Menu, X, ChevronDown } from 'lucide-react';

const navLinks = [
  { label: 'Home', href: '/' },
  {
    label: 'About',
    href: '/about',
    children: [
      { label: 'University', href: '/about' },
      { label: 'Faculties', href: '/faculties' },
      { label: 'Research', href: '/research' },
    ],
  },
  { label: 'Admissions', href: '/admissions' },
  { label: 'Faculties', href: '/faculties' },
  { label: 'Research', href: '/research' },
  { label: 'News', href: '/news' },
  { label: 'Events', href: '/events' },
];

export default function Navbar() {
  const [isOpen, setIsOpen] = useState(false);

  return (
    <header className="sticky top-0 z-50 bg-white border-b border-gray-100">
      {/* Top bar */}
      <div className="bg-rtu-green text-white">
        <div className="rtu-container flex justify-between items-center py-2 text-xs">
          <div className="flex gap-4">
            <span>EN | LV</span>
            <span>+371 67089333</span>
          </div>
          <div className="flex gap-4">
            <Link href="/portal" className="hover:underline font-medium">
              ORTUS Student Portal →
            </Link>
          </div>
        </div>
      </div>

      {/* Main nav */}
      <nav className="rtu-container">
        <div className="flex justify-between items-center h-16">
          {/* Logo */}
          <Link href="/" className="flex items-center gap-3">
            <div className="w-10 h-10 bg-rtu-green rounded-lg flex items-center justify-center">
              <span className="text-white font-black text-sm">RTU</span>
            </div>
            <div className="hidden sm:block">
              <p className="text-sm font-bold text-text-primary leading-tight">Rīgas Tehniskā</p>
              <p className="text-sm font-bold text-text-primary leading-tight">universitāte</p>
            </div>
          </Link>

          {/* Desktop links */}
          <div className="hidden lg:flex items-center gap-1">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                className="px-3 py-2 text-sm font-medium text-text-primary hover:text-rtu-green transition-colors rounded-lg hover:bg-rtu-green-tint"
              >
                {link.label}
              </Link>
            ))}
          </div>

          {/* CTA + Mobile toggle */}
          <div className="flex items-center gap-3">
            <Link href="/admissions" className="hidden md:inline-flex rtu-btn-primary text-sm py-2 px-4">
              Apply Now
            </Link>
            <button
              onClick={() => setIsOpen(!isOpen)}
              className="lg:hidden p-2 text-text-primary"
            >
              {isOpen ? <X size={24} /> : <Menu size={24} />}
            </button>
          </div>
        </div>

        {/* Mobile menu */}
        {isOpen && (
          <div className="lg:hidden border-t py-4 space-y-2">
            {navLinks.map((link) => (
              <Link
                key={link.href}
                href={link.href}
                onClick={() => setIsOpen(false)}
                className="block px-4 py-2 text-sm font-medium text-text-primary hover:bg-rtu-green-tint rounded-lg"
              >
                {link.label}
              </Link>
            ))}
            <Link href="/portal" className="block px-4 py-2 text-sm font-semibold text-rtu-green">
              Student Portal →
            </Link>
          </div>
        )}
      </nav>
    </header>
  );
}
