provider "aws" {
    region = var.aws_region
}

data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

resource "aws_instance" "private_instance" {
  ami                         = "ami-0574da719dca65348"
  availability_zone           = var.private_az
  instance_type               = "t2.micro"
  key_name                    = var.aws_key_name
  vpc_security_group_ids      = [aws_security_group.ssh_proxy.id]
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.aws-subnet-private.id
  source_dest_check           = false
  monitoring                  = false
}
resource "aws_db_instance" "default" {
  allocated_storage    = 20
  db_name              = "mydb"
  engine               = "PostgreSQL"
  engine_version       = "13.7-R1"
  instance_class       = "db.t3.micro"
  username             = var.userRDS
  password             = var.passwordRDS
  skip_final_snapshot  = true
  db_subnet_group_name = aws_subnet.aws-subnet-RDS.id
  vpc_security_group_ids = [aws_security_group.ssh_proxy.id]
}