FROM n8nio/n8n

# Expose port for Render
EXPOSE 5678

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# Create the .n8n directory and set permissions
USER root
RUN mkdir -p /home/node/.n8n && chown -R node:node /home/node/.n8n
USER node

# Start n8n
CMD ["n8n"]
