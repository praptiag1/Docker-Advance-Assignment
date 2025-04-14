#!/bin/bash

# Lightweight Installer Script
set -e

# Configuration
COMPOSE_URL="https://raw.githubusercontent.com/praptiag1/Docker-Advance-Assignment/main/docker-compose.yaml"
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
else
  echo ".env file already exists. Using existing configuration."
fi

echo "
Setup complete!

Next steps:
1. Edit the .env file if needed: 
   nano $TARGET_DIR/.env

2. Start the application:
   cd $TARGET_DIR && docker compose up -d

3. Access the application at:  
   http://localhost:5000

Management commands:
- Stop:          docker compose down
- Stop & clean:  docker compose down -v
- Restart:       docker compose restart
- View logs:     docker compose logs
"

