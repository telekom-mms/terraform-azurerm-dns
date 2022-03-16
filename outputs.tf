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
