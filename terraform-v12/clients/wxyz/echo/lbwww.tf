#--------------------------------------------------------------------------------------
# load balancer
#--------------------------------------------------------------------------------------
module "lb-www-public" {
  source              = "../../../modules/aws_lb"
  name                = var.lb_www_public_name
  subnets             = [var.subnetid2c, var.subnetid2d]
  security_groups     = [module.secgrp-dispatcher-alb.security_group_id]
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.d_tier
}

#--------------------------------------------------------------------------------------
# load balancer Target Group
#--------------------------------------------------------------------------------------
module "lb-target-group-www" {
  source              = "../../../modules/aws_lb_target_group"
  name                = var.lb_www_public_name
  port                = "80"
  protocol            = "HTTP"
  vpc_id              = var.vpcid
  client_name         = var.client_name
  environment_name    = var.environment_name
  application_name    = var.application_name
  application_version = var.application_version
  application_tier    = var.d_tier
}

#--------------------------------------------------------------------------------------
# load balancer Target Group Attach
#--------------------------------------------------------------------------------------
module "lb-target-group-www-attach" {
  source           = "../../../modules/aws_lb_target_group_attachment"
  target_group_arn = module.lb-target-group-www.arn
  target_id        = module.ec2-dispatcher.id
}

#--------------------------------------------------------------------------------------
# load balancer Listener
#--------------------------------------------------------------------------------------
module "lb-www-public-listener-443" {
  source            = "../../../modules/aws_lb_listener_https"
  load_balancer_arn = module.lb-www-public.arn
  port              = "443"
  protocol          = "HTTPS"
  certificate_arn   = var.lb_www_public_listener_cert_arn
  type              = "forward"
  target_group_arn  = module.lb-target-group-www.arn
}

#--------------------------------------------------------------------------------------
# load balancer Listener
#--------------------------------------------------------------------------------------
module "lb-www-public-listener-80" {
  source            = "../../../modules/aws_lb_listener"
  load_balancer_arn = module.lb-www-public.arn
  port              = "80"
  protocol          = "HTTP"
  type              = "forward"
  target_group_arn  = module.lb-target-group-www.arn
}

#--------------------------------------------------------------------------------------
# route53 record
#--------------------------------------------------------------------------------------
# create A record using eip public IP
module "route53-www" {
  source                                  = "../../../modules/aws_route53_record"
  providers                               = {aws = aws.veolia}
  ##(default) zone_id                     = "Z1Q9CG9D_notreal"
  name                                    = "echo65-www-wxyz"
  type                                    = "CNAME"
  records                                 = "echo65-www-wxyz.ctmsp.com.edgekey.net"
  ##(default) ttl                         = "120"
}

