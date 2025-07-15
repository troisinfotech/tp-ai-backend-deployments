#!/bin/bash

COMPOSE_FILE="web-compose.yml"

export VITE_API_URL="http://111.92.61.135"
export VITE_USER_API_URL="http://111.92.61.135:8089/ai1-service"
export VITE_MASTER_API_URL="http://111.92.61.135:8089/ai1-service"
export VITE_ANALYTICS_API_URL="http://111.92.61.135:8089/ai1-service"
export VITE_LICENCE_API_URL="http://111.92.61.135:8089/ai1-service"

echo "🔄 Stopping and removing existing containers..."
docker compose -f "$COMPOSE_FILE" down

docker rmi registry.smartgms.in/product/surveilai-web:latest

echo "🚀 Starting new deployment..."
docker compose -f "$COMPOSE_FILE" up -d

echo "✅ Deployment completed successfully."
