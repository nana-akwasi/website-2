resource "aws_launch_configuration" "main" {
  name          = var.project_name
  image_id      = var.ami
  instance_type = var.instance_type
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
  vpc_zone_identifier       = [var.id_subnet]

  tag = {
    Name                = var.project_name
    propagate_at_launch = true
  }
}