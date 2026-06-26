provider "aws" {
  region = "ap-south-1" # Replace with your desired AWS region
}

resource "aws_instance" "demo-ec2" {
    ami = "ami-01a00762f46d584a1" # Replace with a valid AMI ID for your region
    instance_type = "t2.micro"
    # key_name = "my-key-pair" # Replace with your key pair name
    tags = {
        Name = "DemoEC2Instance"
    }
  
}
resource "random_string" "bucket_suffix" {
    length  = 8
    special = false
}
resource "aws_s3_bucket" "demo-s3-bucket" {
    bucket = "my-demo-s3-bucket-dgdhjggjhggjgjgjhg" # Replace with a unique bucket name    
    tags = {
        Name = "DemoS3Bucket"
    }
}