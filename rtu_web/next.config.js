/** @type {import('next').NextConfig} */
const nextConfig = {
  // Proxy API requests to the shared backend
  async rewrites() {
    return [
      {
        source: '/api/:path*',
        destination: 'http://localhost:3001/api/:path*',
      },
    ];
  },
};

module.exports = nextConfig;
