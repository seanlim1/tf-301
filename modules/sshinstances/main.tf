resource "aws_instance" "ssh" {
  count                  = var.ssh_instance_count
  ami                    = var.ssh_instance_ami_id
  instance_type          = "t3.micro"
  subnet_id              = var.public_subnet_id
  key_name               = var.ssh_key_name
  vpc_security_group_ids = [aws_security_group.allow_ssh.id]

  tags = {
    Name        = "${var.name_prefix}-ssh-${count.index}"
    Environment = var.environment
  }
}
