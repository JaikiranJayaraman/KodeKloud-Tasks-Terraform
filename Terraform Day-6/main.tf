resource "tls_private_key" "devops_key" {
  algorithm = "RSA"
  rsa_bits  = 4096
}


resource "aws_key_pair" "devops-kp" {
  key_name   = "devops-kp"
  public_key = tls_private_key.devops_key.public_key_openssh
}


resource "local_file" "private_key_pem" {
  content         = tls_private_key.devops_key.private_key_pem
  filename        = "/home/bob/xfusion-kp.pem"
  file_permission = "0600"
}


data "aws_security_group" "default" {
  name = "default"
}


resource "aws_instance" "devops-ec2" {

  ami           = "ami-0c101f26f147fa7fd"

  instance_type = "t2.micro"

  key_name      = aws_key_pair.devops-kp.key_name

  vpc_security_group_ids = [data.aws_security_group.default.id]
  
 
  tags = {
    Name = "devops-ec2"
  }
}