FROM n8nio/n8n:latest

# Expose port for Render
EXPOSE 5678

# Set environment variables for Render
ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http
ENV N8N_ENFORCE_SETTINGS_FILE_PERMISSIONS=false

# The n8nio/n8n image already has the correct ENTRYPOINT and CMD
# We don't need to override them, just let the image use its defaults
