variable "env_name" {}

variable "region" {}

variable "tags" {
  type        = "map"
  default     = {}
  description = "Key/value tags to assign to all AWS resources"
}

variable "dj_instance_size" {}

variable "sg_id" {}

variable "instance_ami_map" {
  type = "map"
  default = {
    us-west-1 = "ami-0ec6517f6edbf8044"
    us-east-1 = "ami-0080e4c5bc078760e"
  }
}

variable dj_dns {}

variable "subnet_id" {}

variable "iam_role" {}

variable "private_key" {}