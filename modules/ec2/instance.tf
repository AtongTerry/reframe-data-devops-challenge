resource "aws_instance" "ec2_instance" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.private_subnet_ids[0]  
  vpc_security_group_ids      = [aws_security_group.ec2_sg.id]  
  associate_public_ip_address = false

  user_data = <<-EOF
                #!/bin/bash
                sudo apt update -y
                sudo apt upgrade -y
                sudo apt install -y nginx
                sudo systemctl start nginx
                sudo systemctl enable nginx
                echo "<h1>Welcome to My Nginx Web Server on Ubuntu EC2</h1>" | sudo tee /var/www/html/index.html
                sudo systemctl restart nginx
                EOF

  tags = {
    Name = "${var.project_name}_instance"
  }
}
