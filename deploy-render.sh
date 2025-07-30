#!/bin/bash
# Render Deployment Script for n8n

echo "🚀 Setting up n8n on Render..."

# Environment Variables to set in Render Dashboard:
echo "Add these environment variables in Render:"
echo "N8N_PORT=5678"
echo "N8N_HOST=0.0.0.0"
echo "N8N_PROTOCOL=http"
echo "N8N_BASIC_AUTH_ACTIVE=true"
echo "N8N_BASIC_AUTH_USER=admin"
echo "N8N_BASIC_AUTH_PASSWORD=adminpassword"
echo "WEBHOOK_URL=https://n8nproject-drsp.onrender.com/"
echo "GEMINI_API_KEY=AIzaSyApeU7dGzKFodIYkqOUOM0-SetHQ-jVPXI"

echo "🔧 Render Configuration:"
echo "Runtime: Docker"
echo "Dockerfile Path: ./Dockerfile"
echo "Docker Context: ./"
echo "Port: 5678"
