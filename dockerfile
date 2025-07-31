FROM n8nio/n8n:latest

# Set working directory
WORKDIR /home/node/.n8n

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Create workflows directory and copy workflow
USER root
RUN mkdir -p /home/node/.n8n/workflows
COPY workflow.json /home/node/.n8n/workflows/
COPY start-n8n.sh /home/node/start-n8n.sh
RUN chmod +x /home/node/start-n8n.sh
RUN chown -R node:node /home/node/.n8n
RUN chown node:node /home/node/start-n8n.sh

# Switch back to node user
USER node

# Expose port
EXPOSE 5678

# Use custom startup script
CMD ["/home/node/start-n8n.sh"]
