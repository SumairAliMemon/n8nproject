#!/bin/sh

# Wait a moment for the container to fully initialize
sleep 5

# Start n8n normally - the n8nio/n8n image already handles workflow import
exec n8n start
