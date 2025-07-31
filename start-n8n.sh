#!/bin/bash

# Start n8n in background
n8n start &
N8N_PID=$!

# Wait for n8n to start
echo "Waiting for n8n to start..."
sleep 15

# Import and activate workflow using n8n CLI
echo "Importing workflow..."
n8n import:workflow --separate --input=/home/node/.n8n/workflows/workflow.json

echo "Activating workflow..."
n8n update:workflow --id=1 --active=true

# Bring n8n to foreground
wait $N8N_PID
