variable "ami" {
  description = "(Required) The AMI to use for the instance."
}

variable "ebs_optimized" {
  description = "(Optional) If true, the launched EC2 instance will be EBS-optimized. Note...see docs."
  default = false
}

variable "disable_api_termination" {
  description = "(Optional) If true, enables EC2 Instance Termination Protection."
  default = false
}

variable "instance_initiated_shutdown_behavior" {
  description = "(Optional) Shutdown behavior for the instance. Amazon defaults this to stop for EBS-backed instances and terminate for instance-store instances. Cannot be set on instance-store instances."
  default = "stop"
}

variable "instance_type" {
  description = "(Required) The type of instance to start. Updates to this field will trigger a stop/start of the EC2 instance."
  default = "t2.micro"
}

variable "key_name" {
  description = "(Optional) The key name of the Key Pair to use for the instance; which can be managed using the aws_key_pair resource."
}

variable "get_password_data" {
  description = "(Optional) If true, wait for password data to become available and retrieve it. Useful for getting the administrator password for instances running Microsoft Windows."
  default = false
}

variable "monitoring" {
  description = "(Optional) If true, the launched EC2 instance will have detailed monitoring enabled."
  default = false
}

variable "vpc_security_group_ids" {
  description = "(Optional, VPC only) A list of security group IDs to associate with."
  default = []
}

variable "subnet_id" {
  description = "(Optional) The VPC Subnet ID to launch in."
}

variable "associate_public_ip_address" {
  description = "(Optional) Associate a public ip address with an instance in a VPC. Boolean value."
  default = true
}

variable "user_data" {
  description = "(Optional) The user data to provide when launching the instance. Do not pass gzip-compressed data via this argument; see user_data_base64 instead."
  default = ""
}

variable "source_dest_check" {
  description = "(Optional) Controls if traffic is routed to the instance when the destination address does not match the instance. Used for NAT or VPNs. Defaults true."
  default = true
}

variable "iam_instance_profile" {
  description = "(Optional) The IAM Instance Profile to launch the instance with. Specified as the name of the Instance Profile."
  default = "escobar-ec2-profile-role"
}

variable "root_volume_type" {
  description = "(Optional) The type of volume. Can be 'standard', 'gp2', 'io1', 'sc1', or 'st1'. (Default: 'standard')."
  default = "gp2"
}

variable "root_volume_size" {
  description = "(Optional) The size of the volume in gibibytes (GiB)."
  default = "32"
}

variable "root_volume_delete_on_termination" {
  description = "(Optional) Whether the volume should be destroyed on instance termination (Default: true)."
  default = true
}

variable "root_volume_encrypted" {
  description = "(Optional) Enables EBS encryption on the volume (Default: false). Cannot be used with snapshot_id. Must be configured to perform drift detection."
  default = false
}

variable "root_volume_kms_key_id" {
  description = "(Optional) Amazon Resource Name (ARN) of the KMS Key to use when encrypting the volume. Must be configured to perform drift detection. "
  default = ""
}

variable "instance_create_timeout" {
  description = "(Defaults to 10 mins) Used when launching the instance (until it reaches the initial running state)."
  default = "10m"
}

variable "instance_update_timeout" {
  description = "(Defaults to 10 mins) Used when stopping and starting the instance when necessary during update - e.g. when changing instance type."
  default = "10m"
}

variable "instance_delete_timeout" {
  description = "(Defaults to 20 mins) Used when terminating the instance."
  default = "20m"
}

variable "client_name" {
  description = "A tag to assign to the resource. Represents client code name (ihgp, vifl)."
}

variable "application_name" {
  description = "A tag to assign to the resource. Represents client application name (aem, sitecore)"
}

variable "application_version" {
  description = "A tag to assign to the resource. Represents client application version (6.4, 9.1)."
}

variable "application_tier" {
  description = "A tag to assign to the resource. Represents client application tier (SQL, Author, Solr, etc.)."
}

variable "environment_name" {
  description = "A tag to assign to the resource. Represents client build environment (dev, prod)."
}

variable "terraform_tag" {
  description = "A tag to assign to the resource. Signifies resource created using Terraform. Defaults true."
  default = true
}

variable "os" {
}

variable "os_version" {
}

variable "mount" {
  description = "A tag to assign to the resource. Represents volume mount point."
  default = "root block device"
}

variable "backup" {
  description = "A tag to assign to the resource. Represents that volume should be included in snapshot scripting."
  default = "Backup"
}

variable "region_code" {
}
