# Cloud Resume Challenge v3

A serverless cloud resume website built on AWS with Infrastructure as Code (IaC) using Terraform. This project demonstrates cloud engineering skills by creating a personal resume website with a live visitor counter.

## 🎯 Project Overview

This is my implementation of the [Cloud Resume Challenge](https://cloudresumechallenge.dev/) - a hands-on project designed to showcase cloud engineering skills. The project features:

- **Static Website**: Personal resume hosted on AWS S3
- **Serverless Backend**: AWS Lambda function with Python for visitor tracking
- **Database**: DynamoDB for storing visitor count data
- **CDN**: CloudFront distribution for global content delivery
- **Domain Management**: Route 53 for DNS management with custom domain
- **Security**: HTTPS with ACM SSL certificates
- **Infrastructure as Code**: Complete Terraform automation
- **CI/CD Ready**: Structured for automated deployments

## 🏗️ Architecture

```
Frontend (S3) → CloudFront → Route 53 → Custom Domain
     ↓
JavaScript → Lambda Function → DynamoDB
```

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