resource "aws_lb" "main" {
  name               = var.project_name
  internal           = false
  load_balancer_type = "application"
  security_groups    = [aws_security_group.main.id]
  subnets            = var.id_subnet

  tags = {
    Name    = var.project_name
  }
}

resource "aws_lb_target_group" "main" {
  name     = var.project_name
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.id_vpc
}

resource "aws_lb_listener" "main" {
  load_balancer_arn = aws_lb.main.arn
  port              = "80"
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.main.arn
  }
}

resource "aws_security_group" "main" {
  name        = var.project_name
  vpc_id      = var.id_vpc

  ingress {
    from_port        = 80
    to_port          = 80
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
    Name = var.project_name
  }
}   