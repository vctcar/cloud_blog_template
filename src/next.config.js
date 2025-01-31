/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',
  experimental: {
    appDir: true
  },
  eslint: {
    // Don't run ESLint during builds - we'll handle it separately
    ignoreDuringBuilds: true
  }
}

module.exports = nextConfig