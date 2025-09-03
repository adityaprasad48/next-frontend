# Use official Node.js 22 LTS image
FROM node:22-alpine AS base

# Set working directory
WORKDIR /app

# Copy package.json and package-lock.json (better layer caching)
COPY package*.json ./

# Install dependencies (don't use --production here, because Next.js needs devDependencies for build)
RUN npm install

# Copy source code
COPY . .

# Build Next.js app
RUN npm run build

# Expose Next.js port
EXPOSE 3000

# Run production server
CMD ["npm", "start"]