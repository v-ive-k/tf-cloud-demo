output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.terraform-aws-ec2.public_ip
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = module.terraform-aws-ec2.instance_id
}

output "imported-public_ip" {
  description = "Public IP of EC2 instance"
  value       = module.terraform-aws-ec2-imported.public_ip
}
output "imported-instance_id" {
  description = "ID of the EC2 instance"
  value       = module.terraform-aws-ec2-imported.instance_id
}
output "tags" {
  description = "tags for the instanec created"
  value       = module.terraform-aws-ec2-imported.tags
}
