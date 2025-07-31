#!/bin/sh

echo "🚀 Starting n8n and importing workflow..."

# Start n8n with explicit port binding
N8N_PORT=5678 N8N_HOST=0.0.0.0 n8n start &
N8N_PID=$!

# Wait for n8n to be ready
echo "⏳ Waiting for n8n to start on port 5678..."
sleep 30

# Check if n8n is responding
echo "🔍 Checking if n8n is ready..."
for i in 1 2 3 4 5; do
  if curl -f -s http://localhost:5678/ > /dev/null 2>&1; then
    echo "✅ n8n is responding on port 5678"
    break
  fi
  echo "Attempt $i: n8n not ready yet, waiting..."
  sleep 10
done

echo "📥 Importing workflow via API..."

# Import workflow
WORKFLOW_ID=$(curl -s -X POST "http://localhost:5678/rest/workflows" \
  -H "Content-Type: application/json" \
  -u "admin:adminpassword" \
  -d @/tmp/workflow.json | jq -r '.id' 2>/dev/null || echo "")

echo "Workflow imported with ID: $WORKFLOW_ID"

if [ ! -z "$WORKFLOW_ID" ] && [ "$WORKFLOW_ID" != "null" ]; then
  # Activate the workflow
  echo "✅ Activating workflow..."
  curl -s -X PATCH "http://localhost:5678/rest/workflows/$WORKFLOW_ID" \
    -H "Content-Type: application/json" \
    -u "admin:adminpassword" \
    -d '{"active": true}'
  
  echo "🎉 Workflow is now ACTIVE and ready!"
  echo "🔗 API endpoint: /webhook/pitch"
else
  echo "❌ Failed to import workflow - will need manual import"
fi

echo "🌐 n8n is running on port 5678"
echo "🚀 Service is ready!"

# Keep n8n running
wait $N8N_PID
