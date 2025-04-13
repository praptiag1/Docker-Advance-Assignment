#!/bin/bash

# Lightweight Installer Script
set -e

# Configuration
COMPOSE_URL="https://raw.githubusercontent.com/praptiag1/Docker-Advance-Assignment/main/docker-compose.yml"
ENV_EXAMPLE_URL="https://raw.githubusercontent.com/praptiag1/Docker-Advance-Assignment/main/.env.example"
TARGET_DIR="./myapp"

# Check for required commands
command -v git >/dev/null 2>&1 || { echo >&2 "Git is required but not installed. Aborting."; exit 1; }
# command -v docker >/dev/null 2>&1 || { echo >&2 "Docker is required but not installed. Aborting."; exit 1; }
# command -v docker-compose >/dev/null 2>&1 || { echo >&2 "Docker Compose is required but not installed. Aborting."; exit 1; }
# echo "Setting up Docker application..."

# Create target directory
mkdir -p "$TARGET_DIR"
cd "$TARGET_DIR"

# Download necessary files
echo "Downloading configuration files..."
curl -sSL "$COMPOSE_URL" -o docker-compose.yml
curl -sSL "$ENV_EXAMPLE_URL" -o .env

# Initialize environment
if [ ! -f ".env" ]; then
  cp .env.example .env
  echo "Created .env file from example. Please edit it with your configuration."
fi

echo "
Cloning complete!

To stop:    docker-compose down (in $TARGET_DIR)
            docker compose down -v
To start the application:   docker compose up -d
Access the application at:  http://localhost:5000
To restart: docker-compose restart
To view logs: docker-compose logs
"

