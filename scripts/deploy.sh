
#!/bin/bash
set -Eeuo pipefail

APP_DIR="/home/ubuntu/mysafety"

echo "Starting MySafety deployment..."

cd "$APP_DIR"

# Check required files
test -f Dockerfile
test -f docker-compose.yml
test -f .env

# Validate Docker Compose configuration
docker compose config -q

# Build and start backend services
docker compose up -d --build --remove-orphans

# Show running containers
docker compose ps

echo "MySafety deployment completed!"
