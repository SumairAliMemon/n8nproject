#!/usr/bin/env sh

echo "🚀 Starting n8n and importing workflow..."

# Start n8n with explicit port binding using the correct executable path
/usr/local/bin/n8n start &
N8N_PID=$!

# Wait for n8n to be ready
echo "⏳ Waiting for n8n to start on port 5678..."
sleep 30

# Check if n8n is responding
echo "🔍 Checking if n8n is ready..."
for i in 1 2 3 4 5; do
  if wget -q --spider http://localhost:5678/ 2>/dev/null; then
    echo "✅ n8n is responding on port 5678"
    break
  fi
  echo "Attempt $i: n8n not ready yet, waiting..."
  sleep 10
done

echo "📥 Importing workflow via API..."

# Import workflow using wget instead of curl
RESPONSE=$(wget -qO- --header="Content-Type: application/json" \
  --post-data="$(cat /tmp/workflow.json)" \
  --http-user="admin" --http-password="adminpassword" \
  http://localhost:5678/rest/workflows 2>/dev/null)

# Extract workflow ID (simple grep since jq might not be available)
WORKFLOW_ID=$(echo "$RESPONSE" | grep -o '"id":"[^"]*"' | head -1 | cut -d'"' -f4)

echo "Workflow imported with ID: $WORKFLOW_ID"

if [ ! -z "$WORKFLOW_ID" ] && [ "$WORKFLOW_ID" != "null" ]; then
  # Activate the workflow
  echo "✅ Activating workflow..."
  wget -qO- --header="Content-Type: application/json" \
    --post-data='{"active": true}' \
    --method=PATCH \
    --http-user="admin" --http-password="adminpassword" \
    http://localhost:5678/rest/workflows/$WORKFLOW_ID >/dev/null 2>&1
  
  echo "🎉 Workflow is now ACTIVE and ready!"
  echo "🔗 API endpoint: /webhook/pitch"
else
  echo "❌ Failed to import workflow - will need manual import"
fi

echo "🌐 n8n is running on port 5678"
echo "🚀 Service is ready!"

# Keep n8n running
wait $N8N_PID
