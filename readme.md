# CI/CD Pipeline with GitHub Actions & Docker

This repository demonstrates a complete CI/CD pipeline using GitHub Actions and Docker without requiring any cloud resources. The pipeline builds a Docker image, runs tests, and deploys locally.

![CI/CD Pipeline Workflow](https://github.com/Abhishek72-avail/ci-cd-pipeline/blob/main/docs/images/cicd-pipeline.png)

## Project Overview

This project implements a simple Node.js application with a CI/CD pipeline that:
1. Runs automated tests when code is pushed
2. Builds a Docker image
3. Pushes the image to Docker Hub
4. Provides scripts for local deployment

## Prerequisites

- [Git](https://git-scm.com/)
- [Node.js](https://nodejs.org/) (version 16 or higher)
- [Docker](https://www.docker.com/)
- [Docker Hub Account](https://hub.docker.com/)
- [GitHub Account](https://github.com/)
- [Minikube](https://minikube.sigs.k8s.io/) (optional, for Kubernetes deployment)

## Repository Structure

```
.
├── .github/
│   └── workflows/
│       └── ci-cd.yml      # GitHub Actions workflow configuration
├── app.js                 # Simple Express application
├── package.json           # Node.js dependencies and scripts
├── Dockerfile             # Instructions for building Docker image
├── docker-compose.yml     # Local Docker deployment configuration
├── deployment.yaml        # Kubernetes deployment configuration (optional)
├── setup-minikube.sh      # Script to set up Minikube (optional)
├── deploy-local.sh        # Script for local deployment
└── README.md              # Project documentation
```

## Application Code

The application is a simple Express server that responds with a welcome message.

## Setting Up the CI/CD Pipeline

### 1. Fork/Clone the Repository

```bash
git clone https://github.com/Abhishek72-avail/cicd-demo.git
cd cicd-demo
```

### 2. Configure GitHub Secrets

Add the following secrets to your GitHub repository:
- `DOCKERHUB_USERNAME`: Your Docker Hub username
- `DOCKERHUB_TOKEN`: A Docker Hub access token (not your password)

To add secrets:
1. Go to your GitHub repository
2. Navigate to Settings > Secrets and variables > Actions
3. Click "New repository secret"
4. Add each secret with its corresponding value

### 3. Create Docker Hub Repository

1. Log in to [Docker Hub](https://hub.docker.com/)
2. Create a new repository named "cicd-demo"

### 4. Configure GitHub Actions Workflow

The GitHub Actions workflow is defined in `.github/workflows/ci-cd.yml` and includes:
- Running tests
- Building a Docker image
- Pushing the image to Docker Hub

## Workflow Details

### CI (Continuous Integration)

When code is pushed to the main branch:
1. GitHub Actions checks out the code
2. Installs Node.js dependencies
3. Runs automated tests

### CD (Continuous Deployment)

If tests pass:
1. GitHub Actions builds a Docker image
2. Pushes the image to Docker Hub
3. The deployment script can then pull and run the latest image

## Local Deployment

### Using Docker Compose

1. Pull the latest image:
```bash
docker pull yourdockerhubusername/cicd-demo:latest
```

2. Run with Docker Compose:
```bash
docker-compose up -d
```

### Using Minikube (Optional)

1. Start Minikube:
```bash
minikube start
```

2. Deploy to Kubernetes:
```bash
kubectl apply -f deployment.yaml
```

3. Access the application:
```bash
minikube service cicd-demo --url
```

## Workflow Results

Here's a screenshot of a successful workflow run:

![GitHub Actions Workflow](https://github.com/Abhishek72-avail/cicd-demo/raw/main/docs/images/github-actions.png)

## Deployed Application

After deployment, the application is accessible at http://localhost:3000 (with Docker Compose) or at the URL provided by Minikube.

![Deployed Application](https://github.com/Abhishek72-avail/cicd-demo/raw/main/docs/images/deployed-app.png)

## Troubleshooting

### Docker Hub Authentication
If you encounter Docker Hub authentication issues (401 Unauthorized):
1. Verify your Docker Hub credentials
2. Create a new access token with appropriate permissions
3. Update the GitHub repository secrets

### Node.js Version Issues
If you encounter errors related to unsupported JavaScript features:
1. Update the Node.js version in the Dockerfile to 16 or higher
2. Update the GitHub Actions workflow to use Node.js 16+

## Next Steps

- Add more comprehensive tests
- Implement semantic versioning for Docker images
- Add staging and production environments
- Implement blue/green deployment strategy

## License

MIT

## Author

Abhishek Prasad