terraform {
  required_providers {
    aws ={
        source = "hashicorp/aws"
        version = "~>6.0"
    }
  }
}
provider "aws" {
  region = "us-east-1"
}
resource "aws_vpc" "vpc1" {
  cidr_block = "192.168.0.0/16"
  instance_tenancy = "default"
  tags = {
    name="Day-3-Task"
  }
}