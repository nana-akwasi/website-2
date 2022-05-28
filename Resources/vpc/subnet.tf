resource "aws_subnet" "subnet-1" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_1

  tags = {
    Name = var.project_name-1
  }
}

resource "aws_subnet" "subnet-2" {
  vpc_id     = aws_vpc.main.id
  cidr_block = var.subnet_cidr_2

  tags = {
    Name = var.project_name-2
  }
}