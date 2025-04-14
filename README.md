# Docker-Advance-Assignment
This is a multiservice docker assignment that includes three services: web, db and cache. Build customer Dockerfiles for each service, push it on docker hub and using it in docker compose to run the application in local system.

# Multi-Service User Wishlist App

## Overview

This project is a multi-service User's Wishlist Application built using **Flask**, **Redis**, and **PostgreSQL**. The application allows users to:
 * Add items to their wishlist
 * Delete items from their wishlist
 * Update wishlist items
 * View their wishlist

The application consists of three services:

1. **Flask Web Service**: Handles user interactions and provides RESTful API endpoints.
2. **PostgreSQL Database Service**: Stores wishlist data persistently.
3. **Redis Cache Service**: Improves performance by caching frequently accessed data.

All services run in **Docker containers**, using custom **Dockerfiles**, and are orchestrated using **Docker Compose**. The images are pushed to **Docker Hub** for easy deployment.

The solution includes:

   •	Custom Docker files for each service
   
   •	Docker Compose for orchestration

   •	CI/CD pipeline (GitHub Actions) for automated builds and deployments
   
   •	Security best practices

## Setup Instructions:
1) Copy the given shell script:
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

2) Update .env file with your credentials and save it
3) Change working directory as myapp
4) Stop or remove containers, networks and volumes using: docker compose down -v
5) Start the container using docker compose up -d
6) Access the application : http://localhost:5000
