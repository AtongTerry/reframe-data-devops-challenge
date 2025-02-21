output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = module.ec2.alb_dns_name
}

output "ec2_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = module.ec2.ec2_private_ip
}
