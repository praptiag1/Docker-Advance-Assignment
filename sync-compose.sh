#!/bin/bash

# 1. Get latest compose file
echo "Syncing docker-compose.yaml..."
git pull origin main

# 2. Stop and clean existing containers
echo "Removing old containers..."
docker compose down --remove-orphans

# # 3. Pull images (no builds)
# echo "Pulling latest images..."
# docker-compose pull

# 4. Start containers
echo "Starting services..."
docker compose up -d

# 5. Show status
echo "✅ Current status:"
docker compose ps