terraform {
  required_providers {
    aws={
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}
provider "aws" {
  region = "ap-south-2"
}
resource "aws_vpc" "Main" {
  cidr_block = "10.0.0.0/16"
  instance_tenancy = "default"
  tags = {
    name="Main vpc"
  }
}
resource "aws_security_group" "main-sg" {
  name = "main-sg"
  vpc_id = aws_vpc.Main.id
 ingress {
    protocol="tcp"
    from_port=80
    to_port=80
    cidr_blocks=["0.0.0.0/0"]
}
ingress {
    protocol="tcp"
    from_port=22
    to_port=22
    cidr_blocks=["0.0.0.0/0"]
}
 
}



