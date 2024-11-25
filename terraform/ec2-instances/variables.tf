variable "region" {
  description = "The AWS region where resources will be created"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  default     = "vpc-060d68cf8f4f0ff4b"
}

variable "instance_ami" {
  description = "AMI ID for the instances"
  default     = "ami-0453ec754f44f9a4a"
}

variable "instance_key_name" {
  description = "An Existing Keypair to be used for the instances"
  default     = "lappy-jenkins"
}

variable "instance_subnet_id" {
  description = "Public Subnet ID for the instances"
  default     = "subnet-0305d0946c139cda7"
}

variable "instance_type" {
  description = "The Instance type"
  default     = "t2.micro"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  default     = "itgenius-springboot-app-s3-bucket"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  default     = "itgenius-springboot-app-dynamoDB"
}
