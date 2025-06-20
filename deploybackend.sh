#!/bin/bash

COMPOSE_FILE="backend-compose.yml"

echo "🔄 Stopping and removing existing containers..."
SPRING_PROFILES_ACTIVE=dev docker compose -f "$COMPOSE_FILE" down

docker rmi registry.smartgms.in/product/tp-ai-backend-service:dev
echo "🚀 Starting new deployment..."
SPRING_PROFILES_ACTIVE=dev docker compose -f "$COMPOSE_FILE" up -d

echo "✅ Deployment completed successfully."
