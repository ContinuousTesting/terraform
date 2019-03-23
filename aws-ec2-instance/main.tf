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
  user_data = "${var.user_data}"
  key_name = "${var.key_name}"
  
  tags {
    Name = "${var.name}"
  }
}
