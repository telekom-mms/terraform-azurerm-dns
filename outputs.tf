output "dns_zone" {
  description = "azurerm_dns_zone results"
  value = {
    for dns_zone in keys(azurerm_dns_zone.dns_zone) :
    dns_zone => {
      id                  = azurerm_dns_zone.dns_zone[dns_zone].id
      name                = azurerm_dns_zone.dns_zone[dns_zone].name
      resource_group_name = azurerm_dns_zone.dns_zone[dns_zone].resource_group_name
    }
  }
}
output "private_dns_zone" {
  description = "azurerm_private_dns_zone results"
  value = {
    for private_dns_zone in keys(azurerm_private_dns_zone.private_dns_zone) :
    private_dns_zone => {
      id                        = azurerm_private_dns_zone.private_dns_zone[private_dns_zone].id
      number_of_record_sets     = azurerm_private_dns_zone.private_dns_zone[private_dns_zone].number_of_record_sets
      max_number_of_record_sets = azurerm_private_dns_zone.private_dns_zone[private_dns_zone].max_number_of_record_sets
      soa_record                = azurerm_private_dns_zone.private_dns_zone[private_dns_zone].soa_record
    }
  }
}
output "dns_a_record" {
  description = "azurerm_dns_a_record results"
  value = {
    for dns_a_record in keys(azurerm_dns_a_record.dns_a_record) :
    dns_a_record => {
      id   = azurerm_dns_a_record.dns_a_record[dns_a_record].id
      name = azurerm_dns_a_record.dns_a_record[dns_a_record].name
      fqdn = azurerm_dns_a_record.dns_a_record[dns_a_record].fqdn
    }
  }
}
output "dns_cname_record" {
  description = "azurerm_dns_cname_record results"
  value = {
    for dns_cname_record in keys(azurerm_dns_cname_record.dns_cname_record) :
    dns_cname_record => {
      id   = azurerm_dns_cname_record.dns_cname_record[dns_cname_record].id
      name = azurerm_dns_cname_record.dns_cname_record[dns_cname_record].name
      fqdn = azurerm_dns_cname_record.dns_cname_record[dns_cname_record].fqdn
    }
  }
}
output "dns_txt_record" {
  description = "azurerm_dns_txt_record results"
  value = {
    for dns_txt_record in keys(azurerm_dns_txt_record.dns_txt_record) :
    dns_txt_record => {
      id   = azurerm_dns_txt_record.dns_txt_record[dns_txt_record].id
      name = azurerm_dns_txt_record.dns_txt_record[dns_txt_record].name
      fqdn = azurerm_dns_txt_record.dns_txt_record[dns_txt_record].fqdn
    }
  }
}
output "dns_mx_record" {
  description = "azurerm_dns_mx_record results"
  value = {
    for dns_mx_record in keys(azurerm_dns_mx_record.dns_mx_record) :
    dns_mx_record => {
      id   = azurerm_dns_mx_record.dns_mx_record[dns_mx_record].id
      name = azurerm_dns_mx_record.dns_mx_record[dns_mx_record].name
      fqdn = azurerm_dns_mx_record.dns_mx_record[dns_mx_record].fqdn
    }
  }
}
