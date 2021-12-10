variable "client_name" {}
variable "environment_name" {}
variable "application_name" {}
variable "application_version" {}
variable "facing" {}
variable "a_tier" {}
variable "p_tier" {}
variable "d_tier" {}

variable "vpcid" {}
variable "subnetid2a" {}
variable "subnetid2b" {}
variable "subnetid2c" {}
variable "subnetid2d" {}

variable "az" {}
variable "instance_type_author" {}
variable "instance_type_publisher" {}
variable "instance_type_dispatcher" {}
variable "key_name" {}
variable "iam_instance_profile" {}
variable "os" {}
variable "os_version" {}
variable "root_block_type" {}
variable "root_block_size" {}
variable "mount_aem" {}
variable "mount_disp" {}
variable "device_name" {}

variable "region_code" {}

variable "lb_www_public_name" {}
variable "lb_www_public_listener_cert_arn" {}
variable "authalbdns" {}
variable "lb_auth_public_name" {}
variable "lb_auth_public_listener_cert_arn" {}

variable "ssh_user" {}
variable "ssh_private_key" {}
variable "chef_environment" {}
variable "run_list_author" {}
variable "run_list_publisher" {}
variable "run_list_dispatcher" {}
