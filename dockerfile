FROM n8nio/n8n:latest

# Expose port for Render
EXPOSE 5678

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
