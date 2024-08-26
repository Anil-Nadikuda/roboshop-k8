module "ec2_instance" {
  source  = "terraform-aws-modules/ec2-instance/aws"

  name = "workstation_eksctl"

  instance_type          = "t2.micro"
  ami = data.aws_ami.centos8.id
  vpc_security_group_ids = [aws_security_group.allow_eksctl.id]
  subnet_id              = "subnet-0c9f2bd5c483e48fd"
  user_data = file("workstation.sh")

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

resource "aws_security_group" "allow_eksctl" {
  name        = "allow_eksctl"
  description = "created for eksctl"

  tags = {
    Name = "allow_eksctl"
  }
  ingress {
    description = "all ports"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "centos8" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Centos-8-DevOps-Practice"]
  }
  filter {
        name   = "root-device-type"
        values = ["ebs"]
    }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}