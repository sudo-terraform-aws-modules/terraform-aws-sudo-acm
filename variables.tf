variable "domain_name" {
  type        = string
  description = "Specify the domain for ACM"
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "Specify the alternative names for ACM"
  default     = null
}

variable "zone_name" {
  type        = string
  description = "Specify the zone name for Route53"
  default     = ""
}
