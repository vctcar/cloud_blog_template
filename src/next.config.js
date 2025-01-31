/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',  // Enable standalone output
  experimental: {
    // Optional: Enable if you're using app directory
    appDir: true,
  }
}

module.exports = nextConfig