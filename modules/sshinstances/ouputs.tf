output "ssh_public_ip" {
  value = aws_instance.ssh[*].public_ip
}
