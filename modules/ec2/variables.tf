variable "project_name" {
    type = string
}

variable "ami" {
    type = string
    description = "instance ami"
}

variable "instance_type" {
    type = string
    description = "instance type"
}

variable "vpc_id" {
    type = string
}

variable "public_subnet_ids" {
    type = list(string)
}

variable "private_subnet_ids" {
    type = list(string)
}

variable "vpc_cidr" {
    type = string
}