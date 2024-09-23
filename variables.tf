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
variable "private_dns_a_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "dns_cname_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "private_dns_cname_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "dns_txt_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "private_dns_txt_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "dns_mx_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "private_dns_mx_record" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}
variable "private_dns_zone_virtual_network_link" {
  type        = any
  default     = {}
  description = "resource definition, default settings are defined within locals and merged with var settings"
}

locals {
  default = {
    // resource definition
    dns_zone = {
      name = ""
      soa_record = {
        host_name     = null
        expire_time   = null
        minimum_ttl   = null
        refresh_time  = null
        retry_time    = null
        serial_number = null
        ttl           = null
        tags          = null
      }
      tags = {}
    }
    private_dns_zone = {
      name = ""
      soa_record = {
        host_name     = null
        expire_time   = null
        minimum_ttl   = null
        refresh_time  = null
        retry_time    = null
        serial_number = null
        ttl           = null
        tags          = null
      }
      tags = {}
    }
    dns_a_record = {
      name               = ""
      ttl                = 3600 // define default
      records            = null
      target_resource_id = null
      tags               = {}
    }
    private_dns_a_record = {
      name    = ""
      ttl     = 3600 // define default
      records = null
      tags    = {}
    }
    dns_cname_record = {
      name               = ""
      ttl                = 3600 // define default
      record             = null
      target_resource_id = null
      tags               = {}
    }
    private_dns_cname_record = {
      name   = ""
      ttl    = 3600 // define default
      record = null
      tags   = {}
    }
    dns_txt_record = {
      name = ""
      ttl  = 3600 // define default
      tags = {}
    }
    private_dns_txt_record = {
      name = ""
      ttl  = 3600 // define default
      tags = {}
    }
    dns_mx_record = {
      name = ""
      ttl  = 3600 // define default
      tags = {}
    }
    private_dns_mx_record = {
      name = ""
      ttl  = 3600 // define default
      tags = {}
    }
    private_dns_zone_virtual_network_link = {
      name                 = ""
      registration_enabled = null
      tags                 = {}
    }
  }

  // compare and merge custom and default values
  dns_zone_values = {
    for dns_zone in keys(var.dns_zone) :
    dns_zone => merge(local.default.dns_zone, var.dns_zone[dns_zone])
  }
  private_dns_zone_values = {
    for private_dns_zone in keys(var.private_dns_zone) :
    private_dns_zone => merge(local.default.private_dns_zone, var.private_dns_zone[private_dns_zone])
  }

  // deep merge of all custom and default values
  dns_zone = {
    for dns_zone in keys(var.dns_zone) :
    dns_zone => merge(
      local.dns_zone_values[dns_zone],
      {
        for config in ["soa_record"] :
        config => keys(local.dns_zone_values[dns_zone][config]) == keys(local.default.dns_zone[config]) ? null : merge(local.default.dns_zone[config], local.dns_zone_values[dns_zone][config])
      }
    )
  }
  private_dns_zone = {
    for private_dns_zone in keys(var.private_dns_zone) :
    private_dns_zone => merge(
      local.private_dns_zone_values[private_dns_zone],
      {
        for config in ["soa_record"] :
        config => keys(local.private_dns_zone_values[private_dns_zone][config]) == keys(local.default.private_dns_zone[config]) ? null : merge(local.default.private_dns_zone[config], local.private_dns_zone_values[private_dns_zone][config])
      }
    )
  }
  dns_a_record = {
    for dns_a_record in keys(var.dns_a_record) :
    dns_a_record => merge(local.default.dns_a_record, var.dns_a_record[dns_a_record])
  }
  private_dns_a_record = {
    for private_dns_a_record in keys(var.private_dns_a_record) :
    private_dns_a_record => merge(local.default.private_dns_a_record, var.private_dns_a_record[private_dns_a_record])
  }
  dns_cname_record = {
    for dns_cname_record in keys(var.dns_cname_record) :
    dns_cname_record => merge(local.default.dns_cname_record, var.dns_cname_record[dns_cname_record])
  }
  private_dns_cname_record = {
    for private_dns_cname_record in keys(var.private_dns_cname_record) :
    private_dns_cname_record => merge(local.default.private_dns_cname_record, var.private_dns_cname_record[private_dns_cname_record])
  }
  dns_txt_record = {
    for dns_txt_record in keys(var.dns_txt_record) :
    dns_txt_record => merge(local.default.dns_txt_record, var.dns_txt_record[dns_txt_record])
  }
  private_dns_txt_record = {
    for private_dns_txt_record in keys(var.private_dns_txt_record) :
    private_dns_txt_record => merge(local.default.private_dns_txt_record, var.private_dns_txt_record[private_dns_txt_record])
  }
  dns_mx_record = {
    for dns_mx_record in keys(var.dns_mx_record) :
    dns_mx_record => merge(local.default.dns_mx_record, var.dns_mx_record[dns_mx_record])
  }
  private_dns_mx_record = {
    for private_dns_mx_record in keys(var.private_dns_mx_record) :
    private_dns_mx_record => merge(local.default.private_dns_mx_record, var.private_dns_mx_record[private_dns_mx_record])
  }
  private_dns_zone_virtual_network_link = {
    for private_dns_zone_virtual_network_link in keys(var.private_dns_zone_virtual_network_link) :
    private_dns_zone_virtual_network_link => merge(local.default.private_dns_zone_virtual_network_link, var.private_dns_zone_virtual_network_link[private_dns_zone_virtual_network_link])
  }
}
