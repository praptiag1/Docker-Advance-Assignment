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
1. **Clone repository**
   - git clone https://github.com/praptiag1/Docker-Basic-Assignment
   - cd Docker-Basic-Assignment
2. **Run the Application**
Start all services using Docker Compose:
    - docker-compose up -d
This will start the Flask app, PostgreSQL database, and Redis cache in detached mode.
3. **Verify Running Containers**
    - docker ps
4. **Access the Application**
     http://localhost:5000
   OR
Copy and run the give shell script:
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
## CI/CD Pipeline (Github Actions):
  Workflow Steps (ci-cd.yml)
  1.	Build Docker images with updated image version
  2.	Push to Docker Hub
  3.	Update docker compose , commit and push changes


## Project Workflow
The Project contains 3 custome DockerFiles for web, database and cache services as Dockerfile.web, Dockerfile.db, Dockerfile.cache respectively.
1. The images are build:
    - docker build -t my-web-app -f Dockerfile.web .
      ![image](https://github.com/user-attachments/assets/71006542-48db-4cef-b2ab-0733c9e1c5f4)

    - docker build -t my-db -f Dockerfile.db .
      ![image](https://github.com/user-attachments/assets/b402eee5-ca25-4177-805b-8df67b1546a4)

    - docker build -t my-redis -f Dockerfile.cache .
      ![image](https://github.com/user-attachments/assets/d85c8671-b826-417c-babc-fc0ed3ab1788)

2. List images:
   - docker images
     ![image](https://github.com/user-attachments/assets/cd93dcde-e7b8-4004-9e5a-699d143c770a)
3. Login to docker hub and enter credentials:
   - docker login
     ![image](https://github.com/user-attachments/assets/fbab0bd5-87fc-477f-be22-4229b80e1e80)

4. Tag images
    - docker tag my-web-app praptiag11/my-web-app:v1.0
    - docker tag my-db praptiag11/my-db:v1.0
    - docker tag my-redis praptiag11/my-redis:v1.0
      ![image](https://github.com/user-attachments/assets/61d66122-89af-4eb4-aa05-8d07bca519d9)
5. Push images to Docker Hub:
    - docker push praptiag11/my-web-app:v1.0
    - docker push praptiag11/my-db:v1.0
    - docker push praptiag11/my-redis:v1.0
      ![image](https://github.com/user-attachments/assets/e430dc7b-56e8-4e41-bb24-8d4f96a70f91)
6. Make docker compose YAML file
7. Run Application:
    - docker compose up -d
      ![image](https://github.com/user-attachments/assets/665729e6-1cb5-454a-a492-e1163c00cade)

8. List all running containers:
    - docker ps
      ![image](https://github.com/user-attachments/assets/0d482abe-d15c-4d5c-8c1c-f2900dfe18d7)

9. Access application:
     - http://localhost:5000

## Docker Hub
All images are pushed to Docker Hub for easy deployment. Pull them using:
  - docker pull praptiag11/my-web-app:v1.0
  - docker pull praptiag11/my-db:v1.0
  - docker pull praptiag11/my-redis:v1.0
## Web Interface
1. **Home Page**
   ![image](https://github.com/user-attachments/assets/2492d772-0479-4dca-a78c-3990223d0d36)
   
2. **Add items into wishlist**
   ![image](https://github.com/user-attachments/assets/8cda3220-c14b-4bec-9c42-61aade927080)
   
3. **Fetch the wishlist**
   ![image](https://github.com/user-attachments/assets/383431ed-351b-4213-b81d-f8cfdd67db2d)

4. **List of all Users**
   ![image](https://github.com/user-attachments/assets/860d9de2-3512-424e-b04b-d7c622b1ae21)

5. **Edit Wishlist**

   ![image](https://github.com/user-attachments/assets/fc3955c7-aa5d-46c4-969e-51bb333c77d7)

6. **Delete Wishlist**

   ![image](https://github.com/user-attachments/assets/807ca1e9-1331-4c06-acca-fb97152953f4)

## Docker Logs
The log of a running container can be seen using:
- docker logs <container_name>

eg: ![image](https://github.com/user-attachments/assets/fb00fc76-452b-4e5c-aacb-31beeff22b8c)


## Docker network
New network can be created using 
- docker network create <network_name>
List all the network using
- docker network ls
   ![image](https://github.com/user-attachments/assets/fea01047-b77e-4cb3-bac7-553fad78e467)

Inspect the network using:
- docker network inspect <network_name>
![image](https://github.com/user-attachments/assets/cd379c65-eec0-415e-aed7-5cc5fc5a7c98)
