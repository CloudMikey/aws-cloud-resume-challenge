#Set up the backend for Terraform state files for local and github actions access simultaneously.
provider "aws" {
  region = "us-west-1"  
}

resource "aws_s3_bucket" "tf_state" {
  bucket = "crc-terraform-state-2025"  
  force_destroy = true
}

resource "aws_s3_bucket_versioning" "tf_state_versioning" {
  bucket = aws_s3_bucket.tf_state.id
  versioning_configuration {
    status = "Enabled"
  }
  
}

resource "aws_dynamodb_table" "tf_locks" {
  name         = "crc-terraform-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}