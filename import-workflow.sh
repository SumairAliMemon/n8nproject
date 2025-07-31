#!/bin/sh

echo "🚀 Starting n8n with auto-import workflow..."

# Start n8n in background
/usr/local/bin/n8n start &
N8N_PID=$!

# Wait for n8n to fully start
echo "⏳ Waiting for n8n to start..."
sleep 30

# Try to import workflow using n8n REST API
echo "📥 Attempting to import workflow..."

# First, let's check if n8n is responding
if curl -f -s http://localhost:5678/ > /dev/null 2>&1; then
    echo "✅ n8n is responding"
    
    # Try to import workflow via API
    RESPONSE=$(curl -s -w "%{http_code}" -X POST http://localhost:5678/rest/workflows \
      -H "Content-Type: application/json" \
      -u "admin:adminpassword" \
      -d @/tmp/workflow.json)
    
    echo "Import response: $RESPONSE"
    
    # Wait a moment
    sleep 5
    
    # Try to activate any existing workflow
    echo "✅ Attempting to activate workflow..."
    curl -s -X PATCH http://localhost:5678/rest/workflows/1 \
      -H "Content-Type: application/json" \
      -u "admin:adminpassword" \
      -d '{"active": true}' || echo "Could not activate workflow 1"
    
else
    echo "❌ n8n is not responding, skipping import"
fi

echo "🎉 n8n startup complete!"
echo "🌐 n8n is ready"
echo "🔗 Manual import may be needed via UI"

# Keep n8n running in foreground
wait $N8N_PID
