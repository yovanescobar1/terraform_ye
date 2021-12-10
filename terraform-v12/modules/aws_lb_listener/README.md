
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| certificate_arn |  | string | - | yes |
| lb_target_group_arn |  | string | - | yes |
| load_balancer_arn |  | string | - | yes |
| port |  | string | `443` | no |
| protocol |  | string | `HTTPS` | no |
| ssl_policy |  | string | `ELBSecurityPolicy-2015-05` | no |
| type |  | string | `forward` | no |

## Outputs

| Name | Description |
|------|-------------|
| lb_listener_arn |  |

