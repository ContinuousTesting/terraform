output "public_dns" {
  description = "List of public DNS names assigned to the instances"
  value       = "${module.ec2.public_dns}"
}
output "instance_public_dns" {
  description = "Public DNS name assigned to the EC2 instance"
  value       = "${module.ec2.public_dns[0]}"
}
