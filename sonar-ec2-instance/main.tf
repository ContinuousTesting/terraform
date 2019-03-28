terraform {
  required_version = ">= 0.11.0"
}

provider "aws" {
  region = "${var.aws_region}"
}
backend "s3" {
    bucket = "terraformstate"
    key    = "/home/ec2-user/s3key"
    region = "us-east-2"
  }

resource "aws_instance" "awslinux" {
  ami           = "${var.ami_id}"
  instance_type = "${var.instance_type}"
  availability_zone = "${var.aws_region}a"
  user_data = "${data.template_file.user_data.rendered}"
  key_name = "${var.key_name}"
 tags {
    Name = "${var.name}"
  }
}

data "template_file" "user_data" {
  template = "${file("user_data/user_data.sh")}"
  vars {
     name = "${var.name}"
      }
   }
