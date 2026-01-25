output "public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.demo.public_ip
}
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.demo.id
}
output "security_group_id" {
  description = "ID of the security group allowing SSH"
  value       = aws_security_group.allow_ssh.id
}