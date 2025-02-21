output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_lb.alb.dns_name
}

output "ec2_private_ip" {
  description = "The private IP of the EC2 instance"
  value       = aws_instance.ec2_instance.private_ip
}
