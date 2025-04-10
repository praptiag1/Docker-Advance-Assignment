#!/bin/bash

# 1. Get latest compose file
echo "Syncing docker-compose.yaml..."
git stash push -m "Auto-stash before pull"
git pull origin main
git stash pop || true
# 2. Stop and clean existing containers
echo "Removing old containers..."
docker compose down
docker compose down -v

# 4. Start containers
echo "Starting services..."
docker compose up -d

# 5. Show status
echo "✅ Current status:"
docker compose ps