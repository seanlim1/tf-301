variable "name_prefix" {
  type    = string
  default = "slim" # to change
}

variable "environment" {
  type    = string
  default = "development"
}

variable "vpc_id" {
  type    = string
  default = "vpc-0582d885a3bc6c51b"
}

variable "ssh_key_name" {
  type    = string
  default = "slim-ssh"
}

variable "enable_webapp" {
  type    = bool
  default = true
}
