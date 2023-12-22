resource "aws_security_group" "allow_ssh" {
  name        = "${var.name_prefix}-allow-ssh"
  description = "Allow SSH inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ## Critic: Too exposed. Can this be scoped down to our internal private subnets?
  egress {
    description      = "All traffic to anywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name        = "${var.name_prefix}-allow-ssh"
    Environment = var.environment
  }
}
