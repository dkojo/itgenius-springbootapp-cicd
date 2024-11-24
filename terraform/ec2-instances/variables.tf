variable "region" {
  description = "The AWS region where resources will be created"
  default     = "us-east-1"
}

variable "vpc_id" {
  description = "The ID of the VPC where resources will be created"
  default     = "vpc-09e0d3d45811dfa56"
}

variable "instance_ami" {
  description = "AMI ID for the instances"
  default     = "ami-0195204d5dce06d99"
}

variable "instance_key_name" {
  description = "An Existing Keypair to be used for the instances"
  default     = "key"
}

variable "instance_subnet_id" {
  description = "Public Subnet ID for the instances"
  default     = "subnet-0fcd39b42ee32d8e6"
}

variable "instance_type" {
  description = "The Instance type"
  default     = "t2.micro"
}

variable "s3_bucket_name" {
  description = "The name of the S3 bucket for Terraform state"
  default     = "springboot-app-s3-bucket"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table for Terraform state locking"
  default     = "springboot-app-dynamoDB"
}
