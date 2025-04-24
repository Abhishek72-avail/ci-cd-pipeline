#!/bin/bash
# Pull the latest image
docker pull yourdockerhubusername/cicd-demo:latest

# Stop any running containers
docker-compose down

# Start the service
docker-compose up -d

echo "Application deployed at http://localhost:3000"
