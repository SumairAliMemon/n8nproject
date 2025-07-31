FROM node:18-alpine

# Set working directory
WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm install --production

# Copy application code
COPY server.js ./
COPY .env ./

# Expose port
EXPOSE 5678

# Set environment variables
ENV NODE_ENV=production
ENV PORT=5678

# Start the application
CMD ["npm", "start"]
