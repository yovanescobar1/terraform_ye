variable "zone_id" {
  description = "(Required) The ID of the hosted zone to contain this record."
  default = "Z1Q9CG9D_notreal" 
}

variable "name" {
  description = "(Required) The name of the record."
}

variable "type" {
  description = "(Required) The record type. Valid values are A, AAAA, CAA, CNAME, MX, NAPTR, NS, PTR, SOA, SPF, SRV and TXT."
  default = "CNAME"
}

variable "ttl" {
  description = "(Required for non-alias records) The TTL of the record."
  default = "120"
}

variable "records" {
  description = "(Required for non-alias records) A string list of records."
} 

variable "set_identifier" {
  description = "(Optional) Unique identifier to differentiate records with routing policies from one another. Required if using failover, geolocation, latency, or weighted routing policies documented below."
  default = ""
}

variable "health_check_id" {
  description = "(Optional) The health check the record should be associated with."
  default = ""
}

variable "alias" {
  description = "(Optional) An alias block. Conflicts with ttl & records. Alias record documented below."
  default = ""
}

variable "failover_routing_policy" {
  description = "(Optional) A block indicating the routing behavior when associated health check fails. Conflicts with any other routing policy. Documented below."
  default = ""
}

variable "geolocation_routing_policy" {
  description = "(Optional) A block indicating a routing policy based on the geolocation of the requestor. Conflicts with any other routing policy. Documented below."
  default = ""
}

variable "latency_routing_policy" {
  description = "(Optional) A block indicating a routing policy based on the latency between the requestor and an AWS region. Conflicts with any other routing policy. Documented below."
  default = ""
}

variable "weighted_routing_policy" {
  description = "(Optional) A block indicating a weighted routing policy. Conflicts with any other routing policy. Documented below."
  default = ""
}

variable "multivalue_answer_routing_policy" {
  description = "(Optional) Set to true to indicate a multivalue answer routing policy. Conflicts with any other routing policy."
  default = ""
}

variable "allow_overwrite" {
  description = "(Optional) Allow creation of this record in Terraform to overwrite an existing record, if any. This does not affect the ability to update the record in Terraform and does not prevent other resources within Terraform or manual Route 53 changes outside Terraform from overwriting this record. false by default. This configuration is not recommended for most environments."
   default = false
}
