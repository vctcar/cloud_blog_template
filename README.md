# Next.js Blog Template with AWS App Runner

A production-ready Next.js blog template with automated deployment to AWS App Runner using GitHub Actions. This project features a dual-environment setup (development and production) with infrastructure as code using AWS CloudFormation.

## 🚀 Features

- Next.js 14+ application with TypeScript support
- Multi-environment deployment pipeline (dev/prod)
- Infrastructure as Code using AWS CloudFormation
- Containerized application using Docker
- Automated CI/CD with GitHub Actions
- AWS App Runner for serverless container deployment
- Amazon ECR for container registry
- Tailwind CSS for styling
- ESLint and TypeScript configuration included

## 📋 Prerequisites

- Node.js 18.x or later
- npm or yarn
- Docker
- AWS Account
- GitHub Account
- AWS CLI configured locally

## 🛠️ Local Development

1. Clone the repository:
   ```bash
   git clone [your-repository-url]
   cd [repository-name]
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start the development server:
   ```bash
   npm run dev
   ```

4. Open [http://localhost:3000](http://localhost:3000) in your browser.

## 🐳 Docker Support

Build the Docker image locally:

```bash
docker build -t blog-template .
```

Run the container:

```bash
docker run -p 3000:3000 blog-template
```

## 🏗️ Infrastructure Setup

This project uses AWS App Runner for deployment. The infrastructure is defined using AWS CloudFormation in the `infrastructure/cloudformation` directory.

### Setting up the Infrastructure

1. Navigate to the GitHub Actions tab in your repository
2. Run the "Setup Infrastructure" workflow
3. Select the environment (dev/prod)
4. The workflow will:
   - Deploy the CloudFormation stack
   - Create necessary AWS resources
   - Set up required GitHub secrets

Required AWS resources:
- ECR Repository
- IAM Roles and Policies
- App Runner Service

## 📦 Deployment

The project includes two main GitHub Actions workflows:

1. **Infrastructure Setup** (`infra-setup.yml`):
   - Sets up the AWS infrastructure
   - Creates necessary resources
   - Configures environment secrets

2. **Build, Push and Deploy** (`deploy-push.yaml`):
   - Builds the Next.js application
   - Creates and pushes Docker image to ECR
   - Deploys to AWS App Runner
   - Supports both development and production environments

### Automatic Deployments

- Pushing to `main` triggers a production deployment
- Pushing to `develop` triggers a development deployment
- Manual deployments can be triggered from the GitHub Actions interface

## 🔑 Required Secrets

Set up the following secrets in your GitHub repository:

- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `AWS_ROLE_TO_ASSUME`
- `DEV_ECR_REPOSITORY`
- `PROD_ECR_REPOSITORY`

Environment-specific secrets will be automatically created during infrastructure setup.

## 📁 Project Structure

```
.
├── Dockerfile                 # Multi-stage Docker build
├── infrastructure
│   ├── cloudformation        # AWS CloudFormation templates
│   └── scripts               # Infrastructure scripts
├── src
│   ├── app                   # Next.js app directory
│   ├── components            # React components
│   ├── content              # Blog/portfolio content
│   ├── layouts              # Page layouts
│   └── lib                  # Utility functions
```

## 🛡️ Security

- ECR repository configured with image scanning
- IAM roles with least privilege access
- Secure secrets management
- Environment isolation between dev and prod

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Commit your changes
4. Push to the branch
5. Create a Pull Request
