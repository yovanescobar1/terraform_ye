resource "aws_lb_target_group" "target_group" {
  name                               = var.name
  port                               = var.port
  protocol                           = var.protocol
  vpc_id                             = var.vpc_id
  deregistration_delay               = var.deregistration_delay
  slow_start                         = var.slow_start
  lambda_multi_value_headers_enabled = var.lambda_multi_value_headers_enabled
  proxy_protocol_v2                  = var.proxy_protocol_v2

  stickiness {
    type            = var.stickiness_type
    cookie_duration = var.stickiness_cookie_duration
    enabled         = var.stickiness_enabled
  }

  health_check {
    enabled             = var.health_check_enabled
    interval            = var.interval
    path                = var.path
    port                = var.health_check_port
    protocol            = var.health_check_protocol
    timeout             = var.timeout
    healthy_threshold   = var.healthy_threshold
    unhealthy_threshold = var.unhealthy_threshold
    matcher             = var.matcher
  }

  target_type = var.target_type

  tags = {
    "Name"                = "${var.client_name}-${var.application_name}-${var.application_version}-${var.environment_name}-${var.application_tier}-targetgroup"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Application Tier"    = var.application_tier
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
  }
}
