# **Reframe-Data-Devops-Challenge**

# Terraform ALB with Self-Signed SSL and EC2 Instance

This Terraform setup creates and deploys:
- A **VPC**
- **2 public subnets** in different availabilty zones 
- **2 private subnets** in different availabilty zones
- A **private EC2 instance** running an **Nginx server**
- An **AWS Application Load Balancer (ALB)** with **SSL termination** using a**self-signed certificate**. 
- Automatic **HTTP to HTTPS redirection** for secure traffic.
- Backend **S3** for remote storage of terraform state file. 

---

**Prerequisites**
Before running this Terraform setup, ensure you have:
- **Terraform v1.x.x** installed → [Download](https://developer.hashicorp.com/terraform/downloads)
- **AWS CLI** installed and configured (`aws configure`)
- **IAM user credentials** with permissions for **EC2, ALB, ACM, and VPC**

---

## ** How to Set Up and Run the Terraform Scripts**
### 1 Clone the Repository

* git clone https://github.com/AtongTerry/reframe-data-devops-challenge.git
* cd reframe-data-devops-challenge

### 2️ Initialize Terraform

* terrafrom init

### 3 Deploy the infrastructure 

* terraform apply -auto-approve

### 4 Accessing nginx sever

-- After the deployment is completed, terrafrom will output the ALB dns-name and the instance's private IP.

-- Copy the outputted ALB DNS name and test it in your browser, it will display the default nginx server: **Welcome to nginx!**

## **Assumptions Made**

* EC2 does not have a public IP (only accessible via ALB) and SSH from the VPC cidr block.

* Self-signed SSL certificate is used (no domain name).

* ALB is public-facing and redirects all HTTP traffic to HTTPS.

* The web server runs **nginx on port 80**.

* An S3 bucket to remotely store the terraform state file.

* The use of modules to make the configuraton more dynamic.
_ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ _ 

**Cleanup: Destroy the Infrastructure**

After testing the infrastructure can be destroyed using the command below to avoid AWS charges.

* terraform destroy

### Reframe Data Devops Challenge ###


