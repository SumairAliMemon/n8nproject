FROM n8nio/n8n:latest

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# Copy workflow and import script
USER root
RUN mkdir -p /home/node/.n8n/workflows
COPY workflow.json /tmp/workflow.json
COPY import-workflow.sh /tmp/import-workflow.sh
RUN chmod +x /tmp/import-workflow.sh
RUN chown -R node:node /home/node/.n8n
RUN chown node:node /tmp/workflow.json /tmp/import-workflow.sh

# Switch back to node user
USER node

# Expose port
EXPOSE 5678

# Use custom startup that imports workflow
CMD ["/tmp/import-workflow.sh"]
