variable "aws_region" {
  description = "AWS region"
  default = "us-east-2"
}

variable "ami_id" {
  description = "ID of the AMI to provision. Default is AWS Base Image"
  default = "ami-0cd3dfa4e37921605"
}

variable "instance_type" {
  description = "type of EC2 instance to provision."
  default = "t2.small"
}

variable "name" {
  description = "name to pass to Name tag"
  default = "sonarQube"
}
variable "associate_public_ip_address" {
  description = "Associate a public IP address with the instance"
  default     = "true"
}

variable "key_name" {
  description = "Name the key you will use to access the instance "
  default     = "devopslab"
  }
  variable "AWS_SHARED_CREDENTIALS_FILE" {
    description = "AWS credentials  "
    default     = "/home/ec2-user/.aws/credentials"
    }
