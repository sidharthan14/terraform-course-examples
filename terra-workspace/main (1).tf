provider aws {
region = var.region
}

resource "aws_instance" "web1" {
         ami = var.ami
	 instance_type = var.instance_type
	 tags = {
              Name = "${local.env}-server"
         }
}         

locals {
       env = terraform.workspace
}

variable "region" {
type = string
default = "us-east-1"
}

variable "ami" {
type = string
}

variable "instance_type" {
type = string
}

output "IP"  {
       value = "${aws_instance.web1.private_ip}"
}