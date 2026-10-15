variable "domain_name" {
  type        = string
  description = "Primary domain name for the ACM certificate."
}

variable "subject_alternative_names" {
  type        = list(string)
  description = "(Optional) Additional domain names to include in the certificate."
  default     = []
}

variable "zone_name" {
  type        = string
  description = "(Optional) Route53 hosted zone name for DNS validation. Defaults to domain_name."
  default     = null
}

variable "tags" {
  type        = map(string)
  description = "(Optional) Map of tags to apply to all resources."
  default     = {}
}
