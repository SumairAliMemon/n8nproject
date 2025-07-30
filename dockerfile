FROM n8nio/n8n:latest

# Expose port for Render
EXPOSE 5678

# Set environment variables
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false
ENV PORT=5678

# Ensure n8n starts on the correct port
CMD ["n8n", "start"]
