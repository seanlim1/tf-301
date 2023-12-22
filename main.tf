module "sshinstance" {
  source = "./modules/sshinstances"
  # generic aguments
  name_prefix      = var.name_prefix
  environment      = var.environment
  vpc_id           = var.vpc_id
  public_subnet_id = data.aws_subnets.public.ids[0]
  ssh_key_name     = var.ssh_key_name
  # specifc arguments
  ssh_instance_ami_id = data.aws_ami.amazon_linux.id
  ssh_instance_count  = 1
}

resource "aws_instance" "webapp" {
  count                  = var.enable_webapp ? 1 : 0
  ami                    = data.aws_ami.amazon_linux.id
  instance_type          = "t3.micro"
  subnet_id              = data.aws_subnets.public.ids[0]
  vpc_security_group_ids = [aws_security_group.allow_http.id]

  user_data                   = file("${path.module}/init.sh") # instance runs userdata on boot up
  user_data_replace_on_change = true # this forces instance to be recreated upon update of user data contents

  tags = {
    Name        = "${var.name_prefix}-webapp-${count.index}"
    Environment = var.environment
  }
}
