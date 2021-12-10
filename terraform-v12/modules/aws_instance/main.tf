resource "aws_instance" "instance" {
  ami                                  = var.ami
  #availability_zone                   = var.az
  #placement_group                     = var.placement_group
  #tenancy                             = var.tenancy
  #host_id                             = var.host_id
  #cpu_core_count                      = var.cpu_core_count
  #cpu_threads_per_core                = var.cpu_threads_per_core
  ebs_optimized                        = var.ebs_optimized
  disable_api_termination              = var.disable_api_termination 
  instance_initiated_shutdown_behavior = var.instance_initiated_shutdown_behavior
  instance_type                        = var.instance_type
  key_name                             = var.key_name
  get_password_data                    = var.get_password_data
  monitoring                           = var.monitoring
  vpc_security_group_ids               = var.vpc_security_group_ids
  subnet_id                            = var.subnet_id
  associate_public_ip_address          = var.associate_public_ip_address
  #private_ip                          = var.private_ip
  source_dest_check                    = var.source_dest_check
  user_data                            = var.user_data
  #user_data_base64                    = var.user_data_base64
  iam_instance_profile                 = var.iam_instance_profile
  #ipv6_address_count                  = var.ipv6_address_count
  #ipv6_addresses                      = [var.ipv6_addresses]

  tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_tier}-${var.application_version}-${var.region_code}"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Application Tier"    = var.application_tier
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
    "OS"                  = var.os
    "OS Version"          = var.os_version
  }

  volume_tags = {
    "Name"                = "${var.client_name}-${var.environment_name}-${var.application_tier}-${var.application_version}-${var.region_code}"
    "Client"              = var.client_name
    "Application Name"    = var.application_name
    "Application Version" = var.application_version
    "Application Tier"    = var.application_tier
    "Environment"         = var.environment_name
    "Terraform"           = var.terraform_tag
    "Mount"               = var.mount
    "Backup"              = var.backup
  }

  root_block_device {
    volume_type           = var.root_volume_type
    volume_size           = var.root_volume_size
    #iops                 = var.iops
    delete_on_termination = var.root_volume_delete_on_termination
    encrypted             = var.root_volume_encrypted
    kms_key_id            = var.root_volume_kms_key_id
  }

  #ebs_block_device = {
  #}

  #ephemeral_block_device = {
  #}

  #network_interface = {
  #}

  #credit_specification = {
  #  cpu_credits = var.cpu_credits
  #}

  #hybernation = var.hybernation
  #metadata_options = {
  #  http_endpoint = var.http_endpoint
  #  http_tokens = var.http_tokens
  #  http_put_response_hop_limit = var.http_put_response_hop_limit
  #}

  timeouts {
    create = var.instance_create_timeout
    update = var.instance_update_timeout
    delete = var.instance_delete_timeout
  }
}
