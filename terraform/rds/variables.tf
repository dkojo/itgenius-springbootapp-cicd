variable "region" {
  description = "The AWS region to create resources in"
  default     = "us-east-1"
}

variable "db_name" {
  description = "The name of the database"
  default     = "itgeniusdb"
}

variable "db_username" {
  description = "Master username for the database"
  default     = "itgenius-master"
}

variable "db_password" {
  description = "Master password for the database"
  default     = "itgenius1234"
}

variable "db_instance_class" {
  description = "Instance class for the RDS database"
  default     = "db.t4g.micro"
}

variable "db_engine_version" {
  description = "MySQL Engine Version"
  default     = "8.0"
}

variable "vpc_id" {
  description = "The ID of the VPC where the database will be created"
  default     = "vpc-060d68cf8f4f0ff4b"
}

variable "subnet_ids" {
  description = "The list of subnet IDs to associate with the database"
  type        = list(string)
  default     = ["subnet-0305d0946c139cda7", "subnet-0413b34ddd5fbc136", "subnet-085dd956e5b639f40", "subnet-029b9641533fc3b1e"]
}
