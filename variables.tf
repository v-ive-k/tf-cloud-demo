# variable "region" {
#   description = "AWS region"
#   type        = string
#   default     = "us-east-1"
# }

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "instance_name" {
  description = "EC2 instance name"
  type        = string
  default     = "vivek-tfc-ec2"
}
