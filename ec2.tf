resource "aws_instance" "TLS_SG" {
  ami           = "ami-0fa91bc90632c73c9"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.TF_key.key_name  # <-- add this

  security_groups = [aws_security_group.TLS_SG.name]

  # Use VPC-style security group attachment
  vpc_security_group_ids = [aws_security_group.TLS_SG.id]

  tags = {
    Name = "HelloWorld"
  }
}

resource "aws_security_group" "TLS_SG" {
    name = "security group using Terraform"
    description = "security group using Terraform"
    vpc_id ="vpc-015011f82635e3d1c"

    ingress{
        description ="HTTPS"
        from_port=443
        to_port=443
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
        ingress{
        description ="HTTP"
        from_port=80
        to_port=80
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]
    }
        ingress{
        description ="SSH"
        from_port=22
        to_port=22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
        
    }

    egress {
        from_port =0
        to_port =0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
        ipv6_cidr_blocks = ["::/0"]


    }
    tags = { Name = "TLS_SG" }

}
resource "tls_private_key" "rsa" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

resource "aws_key_pair" "TF_key" {
  key_name   = "TF_key"
  public_key = tls_private_key.rsa.public_key_openssh
}

# Save private key locally
resource "local_file" "TF_key_private" {
  content  = tls_private_key.rsa.private_key_pem
  filename = "tfkey.pem"
}

# Save public key locally with a different name
resource "local_file" "TF_key_public" {
  content  = tls_private_key.rsa.public_key_openssh
  filename = "tfkey.pub"
}
