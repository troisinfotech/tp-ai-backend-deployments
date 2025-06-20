#!/bin/bash

COMPOSE_FILE="web-compose.yml"

export VITE_API_URL="http://192.168.134.253"
export VITE_USER_API_URL="http://192.168.134.253:8080/ai1-service"
export VITE_MASTER_API_URL="http://192.168.134.253:8080/ai1-service"
export VITE_ANALYTICS_API_URL="http://192.168.134.253:8080/ai1-service"
export VITE_LICENCE_API_URL="http://192.168.134.253:8080/ai1-service"

echo "🔄 Stopping and removing existing containers..."
docker compose -f "$COMPOSE_FILE" down

docker rmi registry.smartgms.in/product/surveilai-web:latest

echo "🚀 Starting new deployment..."
docker compose -f "$COMPOSE_FILE" up -d

echo "✅ Deployment completed successfully."
