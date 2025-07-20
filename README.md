# Cloud Resume Challenge 

A serverless cloud resume website built on AWS with Infrastructure as Code (IaC) using Terraform. This project demonstrates cloud engineering skills by creating a personal resume website with a live visitor counter.

## Cloud Resume Challenge Steps

This project follows the official [Cloud Resume Challenge](https://cloudresumechallenge.dev/docs/the-challenge/aws/) requirements:

| Step | Requirement | Implementation |
|------|-------------|----------------|
| 1 | **AWS Certification** | AWS Certified Solutions Architect - Associate |
| 2 | **HTML Resume** | Built from scratch - custom semantic HTML structure |
| 3 | **CSS Styling** | Hand-coded responsive CSS with custom styling system |
| 4 | **S3 Static Website** | S3 bucket with static website hosting |
| 5 | **HTTPS** | CloudFront distribution with SSL |
| 6 | **Custom DNS** | Route 53 + custom domain (mikhaelvillamor.com) |
| 7 | **JavaScript Counter** | Visitor counter in `frontend/website/index.js` |
| 8 | **Database** | DynamoDB table for visitor count |
| 9 | **API** | Lambda function with function URL |
| 10 | **Python** | Lambda function using boto3 |
| 11 | **Tests** | Basic function test (`backend/function_test.py`) |
| 12 | **Infrastructure as Code** | Full Terraform automation (not SAM) |
| 13 | **Source Control** | Git repository with version control |
| 14 | **CI/CD Backend** | GitHub Actions for backend deployment |
| 15 | **CI/CD Frontend** | GitHub Actions for frontend deployment |
| 16 | **Blog Post** | Technical blog about lessons learned |

### 🚀 Challenge Enhancements:
- **100% Infrastructure as Code**: Went beyond requirements by implementing **ALL** AWS resources with Terraform - not just the backend API. This includes S3, CloudFront, Route 53, ACM certificates, IAM roles, and policies
- **Terraform over SAM**: Used Terraform instead of AWS SAM for broader industry applicability and enterprise-grade infrastructure management
- **Lambda Function URL**: Used Lambda Function URL instead of API Gateway for cost optimization - eliminates API Gateway charges while maintaining secure API access
- **Production-Ready Architecture**: Added CloudFront OAC, S3 encryption, comprehensive IAM policies, and proper state management with remote backends
- **Multi-Environment Ready**: Structured Terraform modules support easy deployment to dev/staging/prod environments

## 🎯 Project Overview

This is my implementation of the [Cloud Resume Challenge](https://cloudresumechallenge.dev/) by Forrest Brazeal- a hands-on project designed to showcase cloud engineering skills. The project features:

- **Static Website**: Personal resume hosted on AWS S3
- **Serverless Backend**: AWS Lambda function with Python for visitor tracking
- **Database**: DynamoDB for storing visitor count data
- **CDN**: CloudFront distribution for global content delivery
- **Domain Management**: Route 53 for DNS management with custom domain
- **Security**: HTTPS with ACM SSL certificates
- **Infrastructure as Code**: Complete Terraform automation
- **CI/CD Ready**: Structured for automated deployments

## 🏗️ Architecture

![Cloud Resume Challenge Architecture](./CRC%20Diagram.png)

### Components:
- **Frontend**: HTML, CSS, JavaScript hosted on S3
- **Backend**: Python Lambda function for visitor counting
- **Database**: DynamoDB table for persistent visitor data
- **CDN**: CloudFront for performance and HTTPS
- **DNS**: Route 53 with custom domain (mikhaelvillamor.com)
- **Infrastructure**: Terraform for complete automation

## 📁 Project Structure

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

## 🚀 Technologies Used

### AWS Services:
- **S3**: Static website hosting
- **CloudFront**: Content delivery network
- **Lambda**: Serverless compute
- **DynamoDB**: NoSQL database
- **Route 53**: DNS management
- **ACM**: SSL certificate management
- **IAM**: Security and permissions

### Development Tools:
- **Terraform**: Infrastructure as Code
- **Python**: Backend Lambda function
- **HTML/CSS/JavaScript**: Frontend development
- **Git**: Version control

## 📊 Features

- **Responsive Design**: Mobile-friendly resume layout
- **Live Visitor Counter**: Real-time visitor tracking
- **Custom Domain**: Professional domain with HTTPS
- **Performance Optimized**: CloudFront CDN for fast loading
- **Secure**: HTTPS encryption and proper IAM policies
- **Scalable**: Serverless architecture that scales automatically
- **Cost Effective**: Pay-per-use pricing model

## 🛠️ Deployment

### Prerequisites:
- AWS CLI configured with appropriate permissions
- Terraform installed
- Valid AWS account
- Custom domain (optional)

### Infrastructure Deployment:

1. **Bootstrap (one-time setup)**:
```bash
cd bootstrap/
terraform init
terraform plan
terraform apply
```

2. **Backend Infrastructure**:
```bash
cd backend/
terraform init
terraform plan
terraform apply
```

3. **Frontend Infrastructure**:
```bash
cd frontend/
terraform init
terraform plan
terraform apply
```

## 🎓 Skills Demonstrated

- **Cloud Architecture**: Designing scalable, serverless solutions
- **Infrastructure as Code**: Terraform automation and best practices
- **DevOps**: Infrastructure automation and deployment
- **Security**: IAM policies, HTTPS, and secure configurations
- **Serverless Computing**: Lambda functions and event-driven architecture
- **Database Design**: NoSQL data modeling with DynamoDB
- **Frontend Development**: Responsive web design
- **DNS Management**: Domain configuration and routing

## 📈 Metrics

- **Cost**: ~$1-2/month (primarily Route 53 hosted zone)
- **Performance**: Global CDN with sub-second load times
- **Availability**: 99.9%+ uptime with AWS managed services
- **Scalability**: Handles traffic spikes automatically


## 🔗 Live Demo

Visit the live website: [mikhaelvillamor.com](https://mikhaelvillamor.com)

## 👨‍💻 About the Developer

**Mikhael Angelo C. Villamor**
- AWS Certified Solutions Architect - Associate
- Aspiring Cloud & DevOps Engineer
- [LinkedIn](https://www.linkedin.com/in/mikhael-villamor-95842b362/)
- [GitHub](https://github.com/CloudMikey)

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

---

*This project is part of the Cloud Resume Challenge and demonstrates practical cloud engineering skills through hands-on AWS implementation.*