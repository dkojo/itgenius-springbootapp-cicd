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