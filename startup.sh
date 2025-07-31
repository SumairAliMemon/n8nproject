#!/bin/sh

echo "🚀 Starting n8n and importing workflow..."

# Start n8n in background
n8n &
N8N_PID=$!

# Wait for n8n to be ready
sleep 25

echo "📥 Importing workflow via API..."

# Import workflow
WORKFLOW_ID=$(curl -s -X POST "http://localhost:5678/rest/workflows" \
  -H "Content-Type: application/json" \
  -u "admin:adminpassword" \
  -d @/tmp/workflow.json | grep -o '"id":"[^"]*"' | cut -d'"' -f4)

echo "Workflow imported with ID: $WORKFLOW_ID"

if [ ! -z "$WORKFLOW_ID" ]; then
  # Activate the workflow
  echo "✅ Activating workflow..."
  curl -s -X PATCH "http://localhost:5678/rest/workflows/$WORKFLOW_ID" \
    -H "Content-Type: application/json" \
    -u "admin:adminpassword" \
    -d '{"active": true}'
  
  echo "🎉 Workflow is now ACTIVE and ready!"
  echo "🔗 API endpoint: /webhook/pitch"
else
  echo "❌ Failed to import workflow"
fi

# Keep n8n running
wait $N8N_PID
