terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.7"
    }
  }
}

provider "aws" {
  region = "ap-south-1" # Replace with your desired AWS region
}

resource "random_string" "bucket_suffix" {
  length  = 8
  upper   = false
  special = false
}

resource "aws_instance" "demo_ec2" {
  ami           = "ami-01a00762f46d584a1" # Replace with a valid AMI
  instance_type = "t2.micro"


  tags = {
    Name = "DemoEC2Instance"
  }
}

resource "aws_s3_bucket" "demo_s3_bucket" {
  bucket = "my-demo-s3-bucket-${random_string.bucket_suffix.result}"

  tags = {
    Name = "DemoS3Bucket"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "demo_s3_encryption" {
  bucket = aws_s3_bucket.demo_s3_bucket.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}