terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "awslinux" {
  
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"
  key_name = "${var.key_name}"
  user_data = "${var.user_data}" 
 
  
tags {
    Name = "${var.name}"
  }
}
 data "template_file" "script" {
   template = "${file("user_data/user_data.sh")}" 
vars { 
  user_data = "${var.user_data}" 
  }
}
