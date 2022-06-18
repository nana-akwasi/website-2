resource "aws_launch_configuration" "main" {
  name          = var.project_name
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = "website-2"
  security_groups = [aws_security_group.main.id]
}

resource "aws_autoscaling_group" "main" {
  name                      = var.project_name
  max_size                  = 5
  desired_capacity          = var.desired_capacity
  min_size                  = 0
  health_check_grace_period = 300
  health_check_type         = "EC2"
  force_delete              = true
  launch_configuration      = aws_launch_configuration.main.name
  vpc_zone_identifier       = var.id_subnet

  tag {
    key                 = "Name"
    value               = var.project_name
    propagate_at_launch = true
  }
}

resource "aws_security_group" "main" {
  name        = "${var.project_name}-sg"
  description = "Allow TLS inbound traffic"
  vpc_id      = var.id_vpc

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  ingress {
    description      = "TLS from VPC"
    from_port        = 443
    to_port          = 443
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "${var.project_name}-sg"
  }
}