#!/bin/sh

echo "🚀 Starting n8n with auto-import workflow..."

# Start n8n in background
n8n start &
N8N_PID=$!

# Wait for n8n to fully start
echo "⏳ Waiting for n8n to start..."
sleep 20

# Import workflow using n8n API
echo "📥 Importing workflow..."
curl -X POST http://localhost:5678/rest/workflows/import \
  -H "Content-Type: application/json" \
  -u "${N8N_BASIC_AUTH_USER}:${N8N_BASIC_AUTH_PASSWORD}" \
  -d @/tmp/workflow.json

# Wait a moment
sleep 5

# Activate the workflow (assuming it gets ID 1)
echo "✅ Activating workflow..."
curl -X PATCH http://localhost:5678/rest/workflows/1 \
  -H "Content-Type: application/json" \
  -u "${N8N_BASIC_AUTH_USER}:${N8N_BASIC_AUTH_PASSWORD}" \
  -d '{"active": true}'

echo "🎉 Workflow imported and activated!"
echo "🌐 n8n is ready at http://localhost:5678"
echo "🔗 Webhook available at: /webhook/pitch"

# Keep n8n running in foreground
wait $N8N_PID
