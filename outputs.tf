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
