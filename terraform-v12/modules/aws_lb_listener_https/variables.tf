variable "load_balancer_arn" {
  description = "(Required, Forces New Resource) The ARN of the load balancer."
}

variable "port" {
  description = "(Required) The port on which the load balancer is listening."
  default = "443"
}

variable "protocol" {
  description = "(Optional) The protocol for connections from clients to the load balancer. Valid values are TCP, TLS, UDP, TCP_UDP, HTTP and HTTPS. Defaults to HTTP."
  default = "HTTPS"
}

variable "ssl_policy" {
  description = "(Optional) The name of the SSL Policy for the listener. Required if protocol is HTTPS or TLS."
  default = "ELBSecurityPolicy-2015-05"
}

variable "certificate_arn" {
  description = " (Optional) The ARN of the default SSL server certificate. Exactly one certificate is required if the protocol is HTTPS. For adding additional SSL certificates, see the aws_lb_listener_certificate resource."
}

variable "type" {
  description = "(Required) The type of routing action. Valid values are forward, redirect, fixed-response, authenticate-cognito and authenticate-oidc."
  default = "forward"
}

variable "target_group_arn" {
  description = "(Optional) The ARN of the Target Group to which to route traffic. Required if type is forward."
  default = "forward"
}
