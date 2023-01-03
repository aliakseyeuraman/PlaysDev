resource "aws_security_group" "ssh_proxy" {
    name = "vpc_proxy"
    description = "Proxy scurity policies."

    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        from_port = -1
        to_port = -1
        protocol = "icmp"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    vpc_id = aws_vpc.MyVPC.id

    tags = {
        Name        = "SshProxy",
        Description = "Security group for SSH proxy to VPC"
    }
}
resource "aws_instance" "ssh_proxy" {
  ami                         = "ami-0574da719dca65348"
  availability_zone           = var.public_az
  instance_type               = "t2.micro"
  key_name                    = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.ssh_proxy.id]
  associate_public_ip_address = true
  subnet_id                   = aws_subnet.aws-subnet-public.id
  source_dest_check           = false
  monitoring                  = false
}