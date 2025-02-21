variable "aws_region" {
    type = string
    default = "us-east-1"
}

variable "vpc_cidr" {
    type = string
    default = "10.0.0.0/16"
}

variable "project_name" {
    type = string
    default = "reframe"
}

variable "ami" {
    type = string
    default = "ami-0e1bed4f06a3b463d"
  
}

variable "instance_type" {
    type = string
    default = "t2.small"
  
}