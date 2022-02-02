variable "dns_zone" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "private_dns_zone" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "dns_a_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "dns_a_target" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "dns_cname_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    # resource definition
    dns_zone = {
      name = ""
      tags = {}
    }
    private_dns_zone = {
      name = ""
      tags = {}
    }
    dns_a_record = {
      name = ""
      ttl = "900"
      tags = {}
    }
    dns_a_target = {
      name = ""
      ttl = "900"
      tags = {}
    }
    dns_cname_record = {
      name = ""
      ttl = "900"
      tags = {}
    }
  }

  # compare and merge custom and default values
  # merge all custom and default values
  dns_zone = {
    for dns_zone in keys(var.dns_zone) :
    dns_zone => merge(local.default.dns_zone, var.dns_zone[dns_zone])
  }
  private_dns_zone = {
    for private_dns_zone in keys(var.private_dns_zone) :
    private_dns_zone => merge(local.default.private_dns_zone, var.private_dns_zone[private_dns_zone])
  }
  dns_a_record = {
    for dns_a_record in keys(var.dns_a_record) :
    dns_a_record => merge(local.default.dns_a_record, var.dns_a_record[dns_a_record])
  }
  dns_a_target = {
    for dns_a_target in keys(var.dns_a_target) :
    dns_a_target => merge(local.default.dns_a_target, var.dns_a_target[dns_a_target])
  }
  dns_cname_record = {
    for dns_cname_record in keys(var.dns_cname_record) :
    dns_cname_record => merge(local.default.dns_cname_record, var.dns_cname_record[dns_cname_record])
  }
}
