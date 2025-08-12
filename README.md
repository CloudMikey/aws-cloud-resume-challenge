# Cloud Resume Challenge 

A serverless cloud resume website built on AWS using Terraform for infrastructure management. This project demonstrates practical cloud engineering skills through a complete end-to-end implementation.

## Project Overview

This implementation of the [Cloud Resume Challenge](https://cloudresumechallenge.dev/) includes:

- Static website hosting on AWS S3
- Python Lambda function for visitor tracking 
- DynamoDB database for persistent data storage
- CloudFront CDN for global content delivery
- Custom domain with SSL/TLS certificates
- Complete infrastructure automation with Terraform

## Architecture

![Cloud Resume Challenge Architecture](./CRC%20Diagram.png)

**Components:**
- **Frontend**: HTML, CSS, JavaScript hosted on S3
- **Backend**: Python Lambda function for visitor counting
- **Database**: DynamoDB table for visitor data
- **CDN**: CloudFront distribution with custom domain
- **Infrastructure**: Fully automated with Terraform

## Project Structure

```
CRC_v3/
├── backend/
│   ├── function.py          # Lambda function code
│   ├── main.tf             # Backend infrastructure
│   └── function_test.py    # Lambda function tests
├── bootstrap/
│   └── backend-bootstrap.tf # Initial S3/DynamoDB setup
├── frontend/
│   ├── main.tf             # Frontend infrastructure
│   └── website/
│       ├── index.html      # Resume website
│       ├── index.js        # Visitor counter logic
│       └── styles/         # CSS styling
└── README.md
```

## Technologies

**AWS Services:**
- S3 - Static website hosting
- CloudFront - Content delivery network
- Lambda - Serverless compute
- DynamoDB - NoSQL database
- Route 53 - DNS management
- ACM - SSL certificate management
- IAM - Security and permissions

**Tools:**
- Terraform - Infrastructure as Code
- Python - Backend Lambda function
- HTML/CSS/JavaScript - Frontend development

## Key Features

- Responsive web design
- Real-time visitor counter
- Custom domain with HTTPS
- Global CDN distribution
- Serverless architecture
- Cost-optimized design

## Deployment

**Prerequisites:**
- AWS CLI configured with appropriate permissions
- Terraform installed
- Valid AWS account
- Custom domain registered

**Setup Steps:**

1. Bootstrap (one-time setup):
```bash
cd bootstrap/
terraform init
terraform plan
terraform apply
```

2. Backend Infrastructure:
```bash
cd backend/
terraform init
terraform plan
terraform apply
```

3. Frontend Infrastructure:
```bash
cd frontend/
terraform init
terraform plan
terraform apply
```

## Technical Implementation

**Infrastructure Design:**
- Serverless architecture using AWS Lambda
- Static content delivery via S3 and CloudFront
- DynamoDB for data persistence
- Complete automation with Terraform

**Security:**
- IAM policies with least-privilege access
- HTTPS encryption with ACM certificates
- S3 bucket encryption and access controls
- CloudFront Origin Access Control (OAC)

**Performance:**
- Global CDN distribution
- Cost-optimized with Lambda Function URLs
- Scalable serverless backend

## Live Website

[mikhaelvillamor.com](https://mikhaelvillamor.com)

## About

Built by Mikhael Angelo C. Villamor  
AWS Certified Solutions Architect - Associate  
[LinkedIn](https://www.linkedin.com/in/mikhaelvillamor/) | [GitHub](https://github.com/CloudMikey)
