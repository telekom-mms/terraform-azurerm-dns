variable "resource_group_name" {
  type        = string
  description = "resource_group whitin the resource should be created"
}
variable "tags" {
  type        = any
  default     = {}
  description = "mapping of tags to assign, default settings are defined within locals and merged with var settings"
}
# resource definition
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
  # default values
  default = {
    tags = {}
    # resource definition
    dns_zone         = {}
    private_dns_zone = {}
    dns_a_record = {
      ttl = "900"
    }
    dns_a_target = {
      ttl = "900"
    }
    dns_cname_record = {
      ttl = "900"
    }
  }

  # merge custom and default values
  tags             = merge(local.default.tags, var.tags)
  dns_zone         = merge(local.default.dns_zone, var.dns_zone)
  private_dns_zone = merge(local.default.private_dns_zone, var.private_dns_zone)

  # deep merge
  dns_a_record = {
    # get all config
    for config in keys(var.dns_a_record) :
    config => merge(local.default.dns_a_record, var.dns_a_record[config])
  }
  dns_a_target = {
    # get all config
    for config in keys(var.dns_a_target) :
    config => merge(local.default.dns_a_target, var.dns_a_target[config])
  }
  dns_cname_record = {
    # get all config
    for config in keys(var.dns_cname_record) :
    config => merge(local.default.dns_cname_record, var.dns_cname_record[config])
  }
}
