import type { Metadata } from 'next';
import '../styles/globals.css';
import Navbar from '@/components/layout/Navbar';
import Footer from '@/components/layout/Footer';

export const metadata: Metadata = {
  title: 'Riga Technical University — RTU',
  description:
    'Riga Technical University (RTU) is the leading technical university in the Baltics, offering world-class education in engineering, technology, and natural sciences.',
  keywords: ['RTU', 'Riga Technical University', 'Latvia', 'engineering', 'technology', 'university'],
};

export default function RootLayout({ children }: { children: React.ReactNode }) {
  return (
    <html lang="en">
      <body>
        <Navbar />
        <main className="min-h-screen">{children}</main>
        <Footer />
      </body>
    </html>
  );
}
