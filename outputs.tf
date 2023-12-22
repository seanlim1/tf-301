output "ssh_public_ip" {
  value = module.sshinstance.ssh_public_ip
}

output "webapp_public_ip" {
  value = aws_instance.webapp[*].public_ip
}

## Use of for loop to manipulate a list
output "webapp_http_urls" {
  value = [
    for ip in aws_instance.webapp[*].public_ip : "http://${ip}/"
  ]
}

output "ami_id" {
  value = data.aws_ami.amazon_linux.id
}

output "ami_arn" {
  value = data.aws_ami.amazon_linux.arn
}
