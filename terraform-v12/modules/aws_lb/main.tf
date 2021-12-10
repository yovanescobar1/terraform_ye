resource "aws_lb" "lb" {
  name               = var.name
  load_balancer_type = var.load_balancer_type
  internal           = var.internal
  security_groups    = var.security_groups
  subnets            = var.subnets

  #subnet_mapping {
    #subnet_id     = var.subnet_id
    #allocation_id = var.allocation_id
  #}

  idle_timeout                     = var.idle_timeout
  enable_deletion_protection       = var.enable_deletion_protection
  enable_cross_zone_load_balancing = var.enable_cross_zone_load_balancing
  enable_http2                     = var.enable_http2
  ip_address_type                  = var.ip_address_type

  tags = {
    "Name"                = "${var.client_name}-${var.application_name}-${var.application_version}-${var.environment_name}-${var.application_tier}-lb"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Application Tier"    = var.application_tier
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
  }

  access_logs {
    bucket  = var.bucket
    prefix  = var.prefix
    enabled = var.enabled
  }

  timeouts {
    create = var.lb_create_timeout
    update = var.lb_update_timeout
    delete = var.lb_delete_timeout
  }
}
