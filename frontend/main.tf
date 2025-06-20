#--------------------Providers --------------------#
terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  profile = "vscode"
  region  = "us-west-1"

}

#--------------------S3 Bucket --------------------#

resource "aws_s3_bucket" "dev_bucket" {
  bucket = "mikhael-website-2025"
  force_destroy = true
}
resource "aws_s3_bucket" "test_1" {
  bucket = "no-deploy"
  force_destroy = true
}


resource "aws_s3_bucket_server_side_encryption_configuration" "dev_bucket_encryption" {
  bucket = aws_s3_bucket.dev_bucket.id

  rule {
    bucket_key_enabled = true
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

#This code uploads all files from the "website" directory to the S3 bucket.

resource "aws_s3_object" "dev_objets" {
  for_each = fileset("website", "**/*")
  bucket = aws_s3_bucket.dev_bucket.id
  key    = each.value
  source = "${path.module}/website/${each.value}"
  etag   = filemd5("${path.module}/website/${each.value}")

  content_type = lookup(
    {
      html = "text/html"
      css  = "text/css"
      js   = "application/javascript"
    },
    regex("\\.([^.]+)$", each.value)[0],
    "application/octet-stream"
  )
}

#--------------------CloudFront Distribution --------------------#

#Create a CloudFront Origin Access Control (OAC) to allow CloudFront to access the S3 bucket securely.
resource "aws_cloudfront_origin_access_control" "dev_cf_OAC" {
  name                              = "website-cdn-oac"
  description                       = "Origin Access Control for S3 bucket"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}



resource "aws_cloudfront_distribution" "dev_cf_distribution" {
  enabled             = true
  default_root_object = "index.html"

  origin {
    domain_name              = aws_s3_bucket.dev_bucket.bucket_regional_domain_name
    origin_id                = "s3-origin"
    origin_access_control_id = aws_cloudfront_origin_access_control.dev_cf_OAC.id
  }

  aliases = ["www.mikhaelvillamor.com", "mikhaelvillamor.com"]
  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = "s3-origin"
    viewer_protocol_policy = "redirect-to-https"

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    min_ttl      = 0
    default_ttl  = 3600
    max_ttl      = 86400
    compress     = true
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }

  #ACM certificate for HTTPS
  viewer_certificate {
    acm_certificate_arn            = "arn:aws:acm:us-east-1:061039801477:certificate/b01d02c1-26a3-409e-9597-913eb77f941e"
    ssl_support_method             = "sni-only"
    cloudfront_default_certificate = false
    minimum_protocol_version       = "TLSv1.2_2021"
  }
}

#--------------------S3 Bucket Policy/CloudFront Access --------------------#

# This policy allows CloudFront to access the S3 bucket.
resource "aws_s3_bucket_policy" "allow_cloudfront_access" {
  bucket = aws_s3_bucket.dev_bucket.id
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Sid    = "AllowCloudFrontServicePrincipal"
        Effect = "Allow"
        Principal = {
          Service = "cloudfront.amazonaws.com"
        }
        Action   = "s3:GetObject"
        Resource = "${aws_s3_bucket.dev_bucket.arn}/*"
        Condition = {
          StringEquals = {
            "AWS:SourceArn" = aws_cloudfront_distribution.dev_cf_distribution.arn
          }
        }
      }
    ]
  })
}

#--------------------Route 53 Configuration --------------------#

# Route 53 configuration
data "aws_route53_zone" "main" {
  name         = "mikhaelvillamor.com"
  private_zone = false
}

# Create A record for apex domain (mikhaelvillamor.com)
resource "aws_route53_record" "apex" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "mikhaelvillamor.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.dev_cf_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.dev_cf_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

# Create A record for www subdomain (www.mikhaelvillamor.com)
resource "aws_route53_record" "www" {
  zone_id = data.aws_route53_zone.main.zone_id
  name    = "www.mikhaelvillamor.com"
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.dev_cf_distribution.domain_name
    zone_id                = aws_cloudfront_distribution.dev_cf_distribution.hosted_zone_id
    evaluate_target_health = false
  }
}

#--------------------DynamoDB Table --------------------#
# This DynamoDB table will be used to store website visitor counts.
resource "aws_dynamodb_table" "dev_table" {
  name = "website-visitors"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "id"

  attribute {
    name = "id"
    type = "S"
  }
}

resource "aws_dynamodb_table_item" "dev_item" {
  table_name = aws_dynamodb_table.dev_table.name
  hash_key   = "id"
  item = <<ITEM
{
    "id": {"S": "1"},
    "views": {"N": "0"}
}
ITEM

  lifecycle {
    ignore_changes = [item]
  }
}