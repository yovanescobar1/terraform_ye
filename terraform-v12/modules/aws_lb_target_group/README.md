
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|:----:|:-----:|:-----:|
| application_tier |  | string | - | yes |
| application_version |  | string | - | yes |
| client_name |  | string | - | yes |
| cookie_duration |  | string | `86400` | no |
| deregistration_delay |  | string | `300` | no |
| enabled |  | string | `true` | no |
| environment_name |  | string | - | yes |
| health_check_port |  | string | `traffic-port` | no |
| health_check_protocol |  | string | `HTTP` | no |
| healthy_threshold |  | string | `3` | no |
| interval |  | string | `30` | no |
| lb_target_group_name |  | string | - | yes |
| matcher |  | string | `200-299` | no |
| path |  | string | `/` | no |
| target_group_port |  | string | `80` | no |
| target_group_protocol |  | string | `HTTP` | no |
| target_type |  | string | `instance` | no |
| timeout |  | string | `10` | no |
| type |  | string | `lb_cookie` | no |
| unhealthy_threshold |  | string | `3` | no |
| vpc_id |  | string | - | yes |

## Outputs

| Name | Description |
|------|-------------|
| lb_target_group_arn |  |
| lb_target_group_arn_suffix |  |
| lb_target_group_name |  |

