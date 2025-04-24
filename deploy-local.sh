#!/bin/bash
# Pull the latest image
docker pull yourdockerhubusername/cicd-demo:latest

# Update the deployment
kubectl rollout restart deployment cicd-demo

# Wait for deployment to complete
kubectl rollout status deployment cicd-demo

# Get the URL to access the service
minikube service cicd-demo --url
