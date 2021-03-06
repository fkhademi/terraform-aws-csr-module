variable "name" {
  description = "Name of the instance"
}

variable "vpc_id" {
  description = "VPC ID for the instance"
}

variable "pub_subnet_id" {
  description = "AWS Subnet ID for the PUBLIC interface"
}

variable "lan_subnet_id" {
  description = "AWS Subnet ID for the LAN interface"
}

variable "instance_type" {
  description = "EC2 instance type"
  default     = "t3.medium"
}

variable "ssh_key" {
  description = "Public SSH key for the instance"
}

variable "user_data_base64" {
  description = "base64 encoded userdata"
}
