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



resource "aws_iam_role" "dev_iam_role_for_lambda" {
  name = "iam_role_for_lambda"

  assume_role_policy = <<EOF
{
  "Version": "2012-10-17",
  "Statement": [
    {
      "Action": "sts:AssumeRole",
      "Principal": {
        "Service": "lambda.amazonaws.com"
      },
      "Effect": "Allow",
      "Sid": ""
    }
  ]
}
EOF
}

data "archive_file" "dev_zip" {
  type        = "zip"
  source_file = "${path.module}/function.py"
  output_path = "${path.module}/function.zip"
}

#This attaches the IAM policy to the IAM role 
resource "aws_iam_policy" "dev_iam_policy_CRC" {
  name        = "aws_iam_policy_for_terraform_CRC"
  path        = "/"
  description = "Policy for Lambda function to access DynamoDB"

  policy = jsonencode({
    "Version": "2012-10-17",
    "Statement": [
      {
        "Effect": "Allow",
        "Action": [
          "logs:CreateLogGroup",
          "logs:CreateLogStream",
          "logs:PutLogEvents"
        ],
        "Resource": "arn:aws:logs:*:*:*"
      },
      {
        "Effect": "Allow",
        "Action": [
          "dynamodb:GetItem",
          "dynamodb:UpdateItem",
          "dynamodb:PutItem"
        ],
        "Resource": "arn:aws:dynamodb:us-west-1:061039801477:table/website-visitors"
      }
    ]
  })
}

resource "aws_iam_role_policy_attachment" "dev_attach_policy_to_role" {
  role       = aws_iam_role.dev_iam_role_for_lambda.name
  policy_arn = aws_iam_policy.dev_iam_policy_CRC.arn
}


resource "aws_lambda_function" "dev_funtion" {
  filename         = data.archive_file.dev_zip.output_path
  source_code_hash = data.archive_file.dev_zip.output_base64sha256
  function_name    = "lambda_function"
  role            = aws_iam_role.dev_iam_role_for_lambda.arn
  handler         = "function.lambda_handler"
  runtime         = "python3.9"
}

resource "aws_lambda_function_url" "dev_url" {
  function_name      = aws_lambda_function.dev_funtion.function_name
  authorization_type = "NONE"
  
  cors {
    allow_credentials = true        #Allows credentials to be included in the request
    allow_origins     = ["*"]
    allow_methods     = ["*"]
    allow_headers     = ["date", "keep-alive"]
    expose_headers    = ["date", "keep-alive"]
    max_age          = 7200
  }
}
