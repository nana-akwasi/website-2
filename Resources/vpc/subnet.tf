resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_1
  availability_zone = "us-east-1a"

  tags = {
    Name = var.project_name_1
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_2
  availability_zone = "us-east-1b"

  tags = {
    Name = var.project_name_2
  }
}