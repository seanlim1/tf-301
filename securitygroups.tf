resource "aws_security_group" "allow_http" {
  name        = "${var.name_prefix}-allow-http"
  description = "Allow HTTP inbound traffic"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP from anywhere"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  ## Allow yum package manager to reach the package repositories
  egress {
    description      = "All traffic to anywhere"
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] ## Repository urls are routed through AWS IPv6 endpoints
  }

  tags = {
    Name        = "${var.name_prefix}-allow-http"
    Environment = var.environment
  }

}
