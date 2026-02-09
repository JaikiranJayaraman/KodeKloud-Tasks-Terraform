resource "aws_vpc" "nautilus-vpc"{
    cidr_block="10.0.0.0/16"
    assign_generated_ipv6_cidr_block = true
    tags = {
        name="nautilus-vpc"
    }
}