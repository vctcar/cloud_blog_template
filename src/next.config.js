/** @type {import('next').NextConfig} */
const nextConfig = {
  output: 'standalone',  // Instead of experimental.outputStandalone
  reactStrictMode: true,
  swcMinify: true,
}

module.exports = nextConfig