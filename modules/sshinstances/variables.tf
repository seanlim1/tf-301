variable "name_prefix" {
  type = string
}

variable "environment" {
  type = string
}

variable "vpc_id" {
  type = string
}

variable "public_subnet_id" {
  type = string
}

variable "ssh_key_name" {
  type = string
}

variable "ssh_instance_count" {
  type = number
}

variable "ssh_instance_ami_id" {
  type = string
}
