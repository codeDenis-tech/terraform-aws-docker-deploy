resource "aws_lb" "instance" {
  name               = "alb"
  load_balancer_type = "application"
  subnets = [
    "subnet-07adea6ad1ef80f5a",
    "subnet-070ee9f78c9a86704"
  ]
}

resource "aws_lb_listener" "instance" {
  load_balancer_arn = aws_lb.instance.arn
  port              = 80
  protocol          = "HTTP"
  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.instance.arn
  }
}

resource "aws_lb_target_group" "instance" {
  name                 = "alb-target-group"
  target_type          = "ip"
  protocol             = "HTTP"
  port                 = 8400
  vpc_id               = "vpc-083519d8057ceb271"
  deregistration_delay = 30 // seconds
  health_check {
    interval          = 5 // seconds
    timeout           = 2 // seconds
    healthy_threshold = 2
    protocol          = "HTTP"
    path              = "/"
  }
}
