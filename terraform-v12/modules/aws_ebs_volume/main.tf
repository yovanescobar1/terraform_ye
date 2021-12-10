resource "aws_ebs_volume" "volume" {
  #count                 = var.number_of_volumes
  #availability_zone     = element(split(",", var.az), count.index)
  availability_zone      = var.az
  encrypted              = var.encrypted
  ##iops                 = var.iops
  ##multi_attach_enabled = var.multi_attach_enabled
  size                   = var.volume_size
  snapshot_id            = var.snapshot_id
  ##outpost_arn          = var.outpost_arn
  type                   = var.type
  kms_key_id             = var.kms_key_id

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_tier}-${var.application_version}-volume"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Application Tier"    = var.application_tier
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
    "Mount"               = var.mount
    "Backup"              = var.backup
  }
}
