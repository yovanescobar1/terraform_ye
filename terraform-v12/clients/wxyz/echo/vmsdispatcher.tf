#--------------------------------------------------------------------------------------
# ec2 instance
#--------------------------------------------------------------------------------------
module "ec2-dispatcher" {
  source                                           = "../../../modules/aws_instance"
  ami                                              = data.aws_ami.latest-centos.id
  ##(default) ebs_optimized                        = false
  ##(default) disable_api_termination              = false
  ##(default) instance_initiated_shutdown_behavior = "stop"
  instance_type                                    = var.instance_type_dispatcher
  key_name                                         = var.key_name
  ##(default) get_password_data                    = false
  ##(default) monitoring                           = false
  vpc_security_group_ids                           = [module.secgrp-dispatcher.security_group_id]
  subnet_id                                        = var.subnetid2c
  ##(default) associate_public_ip_address          = true
  ##(default) user_data                            = ""
  ##(default) source_dest_check                    = true
  ##(default) iam_instance_profile                 = "iam_instance_profile-role"
  ##(default) root_volume_type                     = "gp2"
  ##(default) root_volume_size                     = "32"
  ##(default) root_volume_delete_on_termination    = false
  ##(default) root_volume_encrypted                = false
  ##(default) root_volume_kms_key_id               = ""
  client_name                                      = var.client_name
  environment_name                                 = var.environment_name
  application_tier                                 = var.d_tier
  application_version                              = var.application_version
  application_name                                 = var.application_name
  region_code                                      = var.region_code
  ##(default) backup                               = "Backup"
  ##(default) terraform_tag                        = true
  os                                               = var.os
  os_version                                       = var.os_version
}

#--------------------------------------------------------------------------------------
# eip allocate, associate
#--------------------------------------------------------------------------------------
# allocate eip, associate with instance
module "eip-dispatcher" {
  source                                  = "../../../modules/aws_eip"
  ##(default) vpc                         = true
  instance_id                             = module.ec2-dispatcher.id
}

#--------------------------------------------------------------------------------------
# route53 record
#--------------------------------------------------------------------------------------
# create A record using eip public IP
module "route53-dispatcher" {
  source                                  = "../../../modules/aws_route53_record"
  providers                               = {aws = aws.veolia}
  ##(default) zone_id                     = "Z1Q9CG9D_notreal"
  name                                    = "${var.client_name}-${var.environment_name}-${var.d_tier}-${var.application_version}-${var.region_code}"
  type                                    = "A"
  records                                 = module.eip-dispatcher.public_ip
  ##(default) ttl                         = "120"
}

#--------------------------------------------------------------------------------------
# chef provision  ##wxyz-echo-dispatcher-65-usw2c
#--------------------------------------------------------------------------------------
module "chef-provision-dispatcher" {
  source                                  = "../../../modules/chef_provision_linux"
  ##(default) type                        = "ssh"
  user                                    = var.ssh_user
  host                                    = module.eip-dispatcher.public_ip
  ##(default) port                        = "22"
  ##(default) timeout                     = "10m"
  ##(default) script_path                 = ""
  private_key                             = file(var.ssh_private_key)
  ##(default) certificate                 = ""
  ##(default) agent                       = false
  ##(default) agent_identity              = ""
  ##(default) host_key                    = ""
  ##(default) attributes_json             = ""
  ##(default) channel                     = stable
  ##(default) disable_reporting           = false
  environment                             = var.chef_environment
  ##(default) fetch_chef_certificates     = true
  ##(default) log_to_file                 = false
  node_name                               = "${var.client_name}-${var.environment_name}-${var.d_tier}-${var.application_version}-${var.region_code}"
  ##(default) ohai_hints                  = ""
  ##(default) os_type                     = "linux"
  ##(default) recreate_client             = true
  run_list                                = var.run_list_dispatcher
  ##(default) server_url                  = "https://chef.escobar.com/organizations/chef12"
  ##(default) skip_install                = false
  ##(default) skip_register               = false
  ##(default) ssl_verify_mode             = ":verify_peer"
  ##(default) user_name                   = "jenkins_pipeline"
  ##(default) user_key                    = file(var.user_key)
  ##(default) vault_json                  = ""
  ##(default) chef_version                = "12.22.5"
}
