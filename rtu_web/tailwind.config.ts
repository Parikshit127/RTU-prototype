import type { Config } from 'tailwindcss';

const config: Config = {
  content: [
    './src/app/**/*.{js,ts,jsx,tsx,mdx}',
    './src/components/**/*.{js,ts,jsx,tsx,mdx}',
  ],
  theme: {
    extend: {
      // ── RTU Brand Colors ──
      colors: {
        rtu: {
          green: '#005C3A',
          'green-dark': '#003D26',
          'green-light': '#007A4D',
          'green-surface': '#E8F5E9',
          'green-tint': '#F1F8F3',
        },
        surface: {
          DEFAULT: '#FFFFFF',
          bg: '#F5F5F7',
        },
        text: {
          primary: '#1A1A2E',
          secondary: '#666666',
          muted: '#4A4A5A',
        },
      },
      // ── RTU Typography ──
      fontFamily: {
        sans: ['Inter', 'system-ui', '-apple-system', 'sans-serif'],
      },
      // ── Spacing & Sizing ──
      borderRadius: {
        'rtu': '12px',
      },
      boxShadow: {
        'rtu': '0 2px 4px rgba(0, 0, 0, 0.06)',
        'rtu-lg': '0 4px 12px rgba(0, 0, 0, 0.08)',
        'rtu-xl': '0 8px 24px rgba(0, 0, 0, 0.12)',
      },
    },
  },
  plugins: [],
};

export default config;
