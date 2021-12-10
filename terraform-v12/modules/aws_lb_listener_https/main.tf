resource "aws_lb_listener" "listener" {
  load_balancer_arn = var.load_balancer_arn
  port              = var.port
  protocol          = var.protocol
  ssl_policy        = var.ssl_policy
  certificate_arn   = var.certificate_arn

  default_action {
    type             = var.type
    target_group_arn = var.target_group_arn
    # redirect         = var.redirect
    # fixed_response   = var.fixed_response
  }
}
