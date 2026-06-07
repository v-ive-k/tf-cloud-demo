variable "region" {
  description = "AWS region"
  type        = string
  default     = null
}

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

variable "subnets" {
  description = "List of subnet IDs"
  type        = list(string)
  default     = []
}