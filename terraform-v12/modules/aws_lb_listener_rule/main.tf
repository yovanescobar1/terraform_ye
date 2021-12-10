resource "aws_lb_listener_rule" "rule" {
  listener_arn = var.listener_arn
  priority     = var.priority

  action {
    type = var.type
    target_group_arn = var.target_group_arn
  }  

  condition {
    field  = var.field
    values = ["${var.values}"]
  }
}
