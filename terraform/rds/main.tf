provider "aws" {
  region = var.region
}

data "aws_secretsmanager_secret" "db_secret" {
  name = "itgenius-credentials"
}

data "aws_secretsmanager_secret_version" "db_secret_version" {
  secret_id = data.aws_secretsmanager_secret.db_secret.id
}

locals {
  db_credentials = jsondecode(data.aws_secretsmanager_secret_version.db_secret_version.secret_string)
}

# Security group for MySQL
resource "aws_security_group" "itgenius_sg" {
  name        = "itgenius-mysql-sg"
  description = "Allow MySQL traffic on port 3306"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # Open to the world (modify for better security)
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# RDS MySQL Aurora Instance
resource "aws_db_instance" "itgenius_instance" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "mysql"
  engine_version       = var.db_engine_version
  instance_class       = var.db_instance_class
  identifier           = "itgeniusdb"
  db_name                 = var.db_name
  username             = local.db_credentials["username"]
  password             = local.db_credentials["password"]
  publicly_accessible  = true
  vpc_security_group_ids = [aws_security_group.itgenius_sg.id]
  db_subnet_group_name = aws_db_subnet_group.itgenius_subnet_group.name

  backup_retention_period = 7
  multi_az                = false
  auto_minor_version_upgrade = true
  deletion_protection     = false
  skip_final_snapshot     = true
  
}

# Subnet Group for RDS
resource "aws_db_subnet_group" "itgenius_subnet_group" {
  name       = "itgenius-db-subnet-group"
  subnet_ids = var.subnet_ids

  tags = {
    Name = "itgenius-db-subnet-group"
  }
}
