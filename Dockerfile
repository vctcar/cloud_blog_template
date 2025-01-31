# Optimized Dockerfile
FROM node:18-alpine AS builder
WORKDIR /app

# Install dependencies first (better caching)
COPY package*.json ./
RUN npm ci

# Copy source files
COPY . .

# Set build arguments and env
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV NEXT_TELEMETRY_DISABLED 1

# Build the application
RUN npm run build

FROM node:18-alpine AS runner
WORKDIR /app

# Set runtime env variables
ARG NODE_ENV=production
ENV NODE_ENV=${NODE_ENV}
ENV NEXT_TELEMETRY_DISABLED 1

# Create non-root user
RUN addgroup --system --gid 1001 nodejs
RUN adduser --system --uid 1001 nextjs

# Copy only necessary files
COPY --from=builder --chown=nextjs:nodejs /app/public ./public
COPY --from=builder --chown=nextjs:nodejs /app/.next/static ./.next/static
COPY --from=builder --chown=nextjs:nodejs /app/.next/standalone ./

# Switch to non-root user
USER nextjs

# Set runtime configurations
ENV PORT 3000
ENV HOSTNAME "0.0.0.0"

EXPOSE 3000

# Start the application
CMD ["node", "server.js"]