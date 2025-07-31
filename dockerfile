FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Copy workflow to the data directory
USER root
RUN mkdir -p /home/node/.n8n/workflows
COPY workflow.json /home/node/.n8n/workflows/workflow.json
RUN chown -R node:node /home/node/.n8n

# Switch back to node user
USER node

# Expose port
EXPOSE 5678

# Use the default n8n startup (no custom CMD needed)
