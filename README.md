# Next.js Blog Template with AWS App Runner

## 🎯 Quick Start Guide

1. **For Content Creators**
   - Jump to [Content Management](#-project-structure-and-content-management) if you just want to add/edit blog posts
   - No AWS knowledge required for content updates
   - Basic Git knowledge recommended

2. **For Developers**
   - Check [Technical Setup](#-prerequisites) for full deployment
   - AWS and Docker knowledge required for infrastructure changes
   - See [Local Development](#️-local-development) for development setup

## 📁 Project Structure and Content Management

### Adding Content

### Content Creation Guidelines

#### Blog Post Format
```markdown
---
title: Your Blog Post Title
date: '2024-02-01'
description: A brief description of your post
tags: ['nextjs', 'aws', 'tutorial']
---

#### Blog Posts (`/src/content/blog`)
- This is where you'll add your blog post content
- Create new markdown or MDX files for each blog post
- Follow the existing file naming convention
- Include frontmatter for metadata (title, date, description, etc.)

#### Portfolio Item Format
```markdown
---
title: Project Name
date: '2024-02-01'
description: Project description
technologies: ['React', 'AWS']
image: '/images/project-thumbnail.jpg'
---

#### Portfolio Content (`/src/content/portfolio`)
- Add portfolio items and project showcases here
- Similar to blog posts, use markdown or MDX format
- Include project metadata in frontmatter

### Managing Assets

#### Images (`/public/images`)
- Store all blog and portfolio images here
- Images are served statically and can be referenced in your content
- Supported formats: JPG, PNG, GIF, SVG
- Use relative paths in your markdown: `/images/your-image.jpg`

#### Static Files (`/public`)
- Store other static assets like PDFs, documents, or downloadable files
- Files are served from the root URL
- Example: `/public/resume.pdf` is accessible at `/resume.pdf`

### Customizing Layout and Design

#### Page Components (`/src/app`)
- `page.tsx`: Main homepage layout
- `layout.tsx`: Root layout template
- Create new pages by adding new directories with `page.tsx`

#### Components (`/src/components`)
- Reusable React components
- UI elements, buttons, cards, etc.
- Create new components here for use across your site

#### Layout Templates (`/src/layouts`)
- Page layout templates
- Blog post layouts
- Portfolio item layouts
- Create new layouts for different content types

#### Styling
- Global styles: `/src/app/globals.css`
- Tailwind configuration: `tailwind.config.ts`
- Add custom CSS classes and modify the theme

### Example Directory Structure for Content

```
src/
├── content/
│   ├── blog/
│   │   ├── first-post.mdx
│   │   └── second-post.mdx
│   └── portfolio/
│       ├── project-one.mdx
│       └── project-two.mdx
├── components/
│   ├── BlogCard.tsx
│   ├── PortfolioGrid.tsx
│   └── Navigation.tsx
└── layouts/
    ├── BlogPost.tsx
    └── PortfolioItem.tsx
```

## 🎨 Customization Guidelines

1. **Creating New Pages**
   ```bash
   # Create a new page at /about
   mkdir src/app/about
   touch src/app/about/page.tsx
   ```

2. **Adding Blog Posts**
   ```bash
   # Create a new blog post
   touch src/content/blog/your-post-title.mdx
   ```

3. **Creating Components**
   ```bash
   # Add a new reusable component
   touch src/components/YourComponent.tsx
   ```
# Technical details for those wanting to nerd out



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

## 🔧 First-Time Setup

After running the "Setup Infrastructure" workflow, you'll need to manually configure some GitHub secrets:

1. Go to your repository's Settings → Environments
2. Select or create the environment (dev/prod)
3. Add the following secret:
   - Name: `ECR_REPOSITORY_URI`
   - Value: The ECR URI provided in the workflow output

This step is required before running the "Build and Push Image" workflow.

### Deployment Order
0. Add AWS Secrets
1. Run "Setup Infrastructure" workflow
2. Configure the environment secret ECR-URI from Cloudformation Output (manual step)
3. Run "Build and Push Image" workflow
4. Run "Deploy to App Runner" workflow

## 📦 Deployment

The project includes two main GitHub Actions workflows:

1. **Infrastructure Setup** (`infra-setup.yml`):
   - Sets up the AWS infrastructure
   - Creates necessary resources
   - Configures environment secrets

2. **Build and Deploy** (`deploy-push.yaml`):
   - Builds the Next.js application
   - Creates and pushes Docker image to ECR
   - Deploys to AWS App Runner
   - Supports both development and production environments

3. **Deploy APP Runner** (`deploy-app-runner.yaml`):
   - Deploys the application to AWS App Runner
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


## 🔍 Troubleshooting

Common issues and solutions:

1. **Images not showing**
   - Ensure images are in `/public/images`
   - Use correct path format: `/images/your-image.jpg`

2. **MDX content not rendering**
   - Check frontmatter format
   - Verify file extension is `.mdx`

3. **Deployment failing**
   - Verify all required secrets are set
   - Check CloudFormation stack events
   - Ensure ECR repository exists

## 📱 Responsive Design

- Built-in mobile responsiveness with Tailwind CSS
- Test your changes using browser dev tools
- Key breakpoints defined in `tailwind.config.ts`

# Cleanup Resources

## 🧹 Resource Cleanup

When you're done with your deployment or want to remove all resources, follow these steps to ensure proper cleanup and avoid unnecessary AWS charges.

### Automated Cleanup

1. **Manual CloudFormation Cleanup**
   ```bash
   # Delete App Runner stack, wait until this fully completes otherwise it will fail and you will need to force delete
   aws cloudformation delete-stack \
     --stack-name dev-app-runner-stack

   # Delete ECR stack
   aws cloudformation delete-stack \
     --stack-name dev-ecr-stack
   ```

2. **Using GitHub Actions (Recommended)**
   ```bash
   # Navigate to Actions tab
   # Select "Cleanup.yml" workflow
   # Click "Run workflow"
   ```

   This workflow will automatically:
   - Delete App Runner service
   - Remove ECR repository and images
   - Delete CloudFormation stacks
   - Clean up associated resources
### Cleanup Order

For proper resource deletion, follow this order:

1. App Runner service (depends on ECR)
2. ECR repositories and images
3. CloudFormation stacks
4. IAM roles and policies

### Verification Steps

After cleanup, verify:

1. **App Runner**
   ```bash
   aws apprunner list-services
   ```

2. **ECR Repositories**
   ```bash
   aws ecr describe-repositories
   ```

3. **CloudFormation Stacks**
   ```bash
   aws cloudformation list-stacks
   ```

### Best Practices

1. **Always Clean Up Dev Environment First**
   - Test cleanup process in dev
   - Verify no dependencies before prod cleanup

2. **Check for Dependencies**
   ```bash
   # List resources in stack
   aws cloudformation list-stack-resources \
     --stack-name dev-app-runner-stack
   ```

3. **Monitor Deletion Progress**
   ```bash
   # Watch stack deletion status
   aws cloudformation describe-stacks \
     --stack-name dev-app-runner-stack \
     --query 'Stacks[0].StackStatus'
   ```

### Troubleshooting Cleanup

If resources fail to delete:

1. **Stack Deletion Fails**
   - Check CloudFormation events
   ```bash
   aws cloudformation describe-stack-events \
     --stack-name dev-app-runner-stack
   ```

2. **Manual Resource Cleanup**
   ```bash
   # Force delete ECR repository
   aws ecr delete-repository \
     --repository-name dev-blog-template \
     --force
   ```

3. **IAM Role Dependencies**
   - Check for attached policies
   - Remove policies before deleting roles

### Cost Verification

After cleanup, verify in AWS Console:
- CloudWatch logs are removed
- ECR images are deleted
- No orphaned resources remain

### Environment Cleanup

Don't forget to:
1. Remove GitHub repository secrets
2. Delete environment configurations
3. Clean up local Docker images
   ```bash
   docker rmi $(docker images 'blog-template' -q)
   ```

### Local Development Cleanup

Clean up local development environment:
```bash
# Remove node modules
rm -rf node_modules

# Clean Next.js build
rm -rf .next

# Remove Docker images
docker system prune -f
```