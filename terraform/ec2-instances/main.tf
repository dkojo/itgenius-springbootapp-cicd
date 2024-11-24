provider "aws" {
  region = var.region
}

# Define security groups
resource "aws_security_group" "nexus_sg" {
  vpc_id      = var.vpc_id
  name        = "nexus-sg"
  description = "Security group for Nexus server"

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "sonarqube_sg" {
  vpc_id      = var.vpc_id
  name        = "sonarqube-sg"
  description = "Security group for Sonarqube server"

  ingress {
    from_port   = 9000
    to_port     = 9000
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 9092
    to_port     = 9092
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "monolithic_sg" {
  vpc_id      = var.vpc_id
  name        = "monolithic-sg"
  description = "Security group for Monolithic server"

  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "ansible_sg" {
  vpc_id      = var.vpc_id
  name        = "ansible-sg"
  description = "Security group for Ansible server"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}



# Define instances
resource "aws_instance" "nexus_server" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.instance_key_name
  vpc_security_group_ids = [aws_security_group.nexus_sg.id]
  subnet_id              = var.instance_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "nexus_server"
  }
}

resource "aws_instance" "sonarqube_server" {
  ami                    = var.instance_ami
  instance_type          = t2.medium
  key_name               = var.instance_key_name
  vpc_security_group_ids = [aws_security_group.sonarqube_sg.id]
  subnet_id              = var.instance_subnet_id
  associate_public_ip_address = true

  tags = {
    Name = "sonarqube_server"
  }
}

resource "aws_instance" "monolithic_server" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.instance_key_name
  vpc_security_group_ids = [aws_security_group.monolithic_sg.id]
  subnet_id              = var.instance_subnet_id
  associate_public_ip_address = true

   tags = {
    Name = "monolithic_server"
  }
}

resource "aws_instance" "ansible_server" {
  ami                    = var.instance_ami
  instance_type          = var.instance_type
  key_name               = var.instance_key_name
  vpc_security_group_ids = [aws_security_group.ansible_sg.id]
  subnet_id              = var.instance_subnet_id
  associate_public_ip_address = true

   tags = {
    Name = "ansible_server"
  }
}


