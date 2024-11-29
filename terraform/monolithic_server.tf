# Create IAM Role for EC2 with Secrets Manager Full Access
resource "aws_iam_role" "secrets_manager_role" {
  name = "secrets-manager-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}

# Attach Secrets Manager Full Access Policy to the Role
resource "aws_iam_role_policy_attachment" "secrets_manager_full_access" {
  role       = aws_iam_role.secrets_manager_role.name
  policy_arn = "arn:aws:iam::aws:policy/SecretsManagerReadWrite"
}

# Create an Instance Profile for the Role
resource "aws_iam_instance_profile" "secrets_manager_instance_profile" {
  name = "secrets-manager-instance-profile"
  role = aws_iam_role.secrets_manager_role.name
}

# Create EC2 Instance with IAM Role Attached
resource "aws_instance" "monolithic_server" {
  ami                         = var.instance_ami
  instance_type               = var.instance_type
  key_name                    = var.instance_key_name
  vpc_security_group_ids      = [aws_security_group.monolithic_sg.id]
  subnet_id                   = var.instance_subnet_id
  associate_public_ip_address = true
  iam_instance_profile        = aws_iam_instance_profile.secrets_manager_instance_profile.name

  tags = {
    Name = "monolithic_server"
  }
}
