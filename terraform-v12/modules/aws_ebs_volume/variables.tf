variable "number_of_volumes" {
  default = "1"
}

variable "az" {
  description = "(Required) The AZ where the EBS volume will exist."
}

variable "encrypted" {
  description = "(Optional) If true, the disk will be encrypted."
  default = false
}

variable "iops" {
  description = "(Optional) The amount of IOPS to provision for the disk."
  default = ""
}

variable "multi_attach_enabled" {
  description = "(Optional) Specifies whether to enable Amazon EBS Multi-Attach. Multi-Attach is supported exclusively on io1 volumes. "
  default = ""
}

variable "volume_size" {
  description = "(Optional) The size of the drive in GiBs."
}

variable "snapshot_id" {
  description = "(Optional) A snapshot to base the EBS volume off of."
  default = ""
}

variable "outpost_arn" {
  description = "(Optional) The Amazon Resource Name (ARN) of the Outpost. "
  default = ""
}

variable "type" {
  description = "(Optional) The type of EBS volume. Can be 'standard', 'gp2', 'io1', 'sc1' or 'st1' (Default: 'standard')."
  default = "gp2"
}

variable "kms_key_id" {
  description = "(Optional) The ARN for the KMS encryption key. When specifying kms_key_id, encrypted needs to be set to true."
  default = ""
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
  description = "A tag to assign to the resource. Represents client application tier (SQL, SOLR, etc.)."
}

variable "environment_name" {
  description = "A tag to assign to the resource. Represents client build environment (dev, prod)."
}

variable "terraform_tag" {
  description = "A tag to assign to the resource. Signifies resource created using Terraform. Defaults true."
  default = true
}

variable "mount" {
  description = "A tag to assign to the resource. Represents volume mount point."
  default = "/opt"
}

variable "backup" {
  description = "A tag to assign to the resource. Represents that volume should be included in snapshot scripting."
  default = "Backup"
}
