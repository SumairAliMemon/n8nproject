FROM n8nio/n8n

# Expose port for Render
EXPOSE 5678

ENV N8N_PORT=5678
ENV N8N_HOST=0.0.0.0
ENV N8N_PROTOCOL=http

# API Keys
ENV GEMINI_API_KEY=AIzaSyApeU7dGzKFodIYkqOUOM0-SetHQ-jVPXI

# Copy your exported workflow
COPY workflow.json /app/workflow.json

# Import the workflow then start n8n
CMD ["sh", "-c", "n8n import:workflow --input=/app/workflow.json && n8n start"]
