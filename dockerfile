FROM n8nio/n8n:latest

# Set environment variables for proper port binding
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV PORT=5678

# Copy workflow and startup script
USER root
COPY workflow.json /tmp/workflow.json
COPY startup.sh /tmp/startup.sh
RUN chmod +x /tmp/startup.sh

# Switch back to node user
USER node

# Expose port explicitly
EXPOSE 5678

# Use startup script to auto-import workflow
CMD ["/tmp/startup.sh"]
