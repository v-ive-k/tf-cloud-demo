output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.terraform-aws-ec2.public_ip
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.terraform-aws-ec2.instance_id
}
output "security_group_id" {
  description = "ID of the security group allowing SSH"
  value       = module.terraform-aws-ec2.security_group_id
}