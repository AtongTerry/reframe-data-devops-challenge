resource "aws_instance" "ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_ids[0]  
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]  
  associate_public_ip_address = false

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt install nginx -y
                sudo ufw allow 'Nginx HTTP'
                sudo systemctl start nginx
                sudo systemctl enable nginx
                EOF

  tags = {
    Name = "${var.project_name}_instance"
  }
}
