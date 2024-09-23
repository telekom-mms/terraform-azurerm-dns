output "dns_zone" {
  description = "Outputs all attributes of resource_type."
  value = {
    for dns_zone in keys(azurerm_dns_zone.dns_zone) :
    dns_zone => {
      for key, value in azurerm_dns_zone.dns_zone[dns_zone] :
      key => value
    }
  }
}
output "private_dns_zone" {
  description = "Outputs all attributes of resource_type."
  value = {
    for private_dns_zone in keys(azurerm_private_dns_zone.private_dns_zone) :
    private_dns_zone => {
      for key, value in azurerm_private_dns_zone.private_dns_zone[private_dns_zone] :
      key => value
    }
  }
}

output "dns_a_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for dns_a_record in keys(azurerm_dns_a_record.dns_a_record) :
    dns_a_record => {
      for key, value in azurerm_dns_a_record.dns_a_record[dns_a_record] :
      key => value
    }
  }
}
output "private_dns_a_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for private_dns_a_record in keys(azurerm_private_dns_a_record.private_dns_a_record) :
    private_dns_a_record => {
      for key, value in azurerm_private_dns_a_record.private_dns_a_record[private_dns_a_record] :
      key => value
    }
  }
}

output "dns_cname_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for dns_cname_record in keys(azurerm_dns_cname_record.dns_cname_record) :
    dns_cname_record => {
      for key, value in azurerm_dns_cname_record.dns_cname_record[dns_cname_record] :
      key => value
    }
  }
}
output "private_dns_cname_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for private_dns_cname_record in keys(azurerm_private_dns_cname_record.private_dns_cname_record) :
    private_dns_cname_record => {
      for key, value in azurerm_private_dns_cname_record.private_dns_cname_record[private_dns_cname_record] :
      key => value
    }
  }
}

output "dns_txt_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for dns_txt_record in keys(azurerm_dns_txt_record.dns_txt_record) :
    dns_txt_record => {
      for key, value in azurerm_dns_txt_record.dns_txt_record[dns_txt_record] :
      key => value
    }
  }
}
output "private_dns_txt_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for private_dns_txt_record in keys(azurerm_private_dns_txt_record.private_dns_txt_record) :
    private_dns_txt_record => {
      for key, value in azurerm_private_dns_txt_record.private_dns_txt_record[private_dns_txt_record] :
      key => value
    }
  }
}

output "dns_mx_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for dns_mx_record in keys(azurerm_dns_mx_record.dns_mx_record) :
    dns_mx_record => {
      for key, value in azurerm_dns_mx_record.dns_mx_record[dns_mx_record] :
      key => value
    }
  }
}
output "private_dns_mx_record" {
  description = "Outputs all attributes of resource_type."
  value = {
    for private_dns_mx_record in keys(azurerm_private_dns_mx_record.private_dns_mx_record) :
    private_dns_mx_record => {
      for key, value in azurerm_private_dns_mx_record.private_dns_mx_record[private_dns_mx_record] :
      key => value
    }
  }
}

output "private_dns_zone_virtual_network_link" {
  description = "Outputs all attributes of resource_type."
  value = {
    for private_dns_zone_virtual_network_link in keys(azurerm_private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link) :
    private_dns_zone_virtual_network_link => {
      for key, value in azurerm_private_dns_zone_virtual_network_link.private_dns_zone_virtual_network_link[private_dns_zone_virtual_network_link] :
      key => value
    }
  }
}

output "variables" {
  description = "Displays all configurable variables passed by the module. __default__ = predefined values per module. __merged__ = result of merging the default values and custom values passed to the module"
  value = {
    default = {
      for variable in keys(local.default) :
      variable => local.default[variable]
    }
    merged = {
      dns_zone = {
        for key in keys(var.dns_zone) :
        key => local.dns_zone[key]
      }
      private_dns_zone = {
        for key in keys(var.private_dns_zone) :
        key => local.private_dns_zone[key]
      }
      dns_a_record = {
        for key in keys(var.dns_a_record) :
        key => local.dns_a_record[key]
      }
      dns_cname_record = {
        for key in keys(var.dns_cname_record) :
        key => local.dns_cname_record[key]
      }
      dns_txt_record = {
        for key in keys(var.dns_txt_record) :
        key => local.dns_txt_record[key]
      }
      dns_mx_record = {
        for key in keys(var.dns_mx_record) :
        key => local.dns_mx_record[key]
      }
      private_dns_zone_virtual_network_link = {
        for key in keys(var.private_dns_zone_virtual_network_link) :
        key => local.private_dns_zone_virtual_network_link[key]
      }
    }
  }
}
