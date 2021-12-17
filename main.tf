# DNS Zone
resource "azurerm_dns_zone" "dns_zone" {
  for_each = local.dns_zone

  name                = each.value
  resource_group_name = var.resource_group_name

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }
}

resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each = local.private_dns_zone

  name                = each.value
  resource_group_name = var.resource_group_name

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }
}

# A Records
resource "azurerm_dns_a_record" "dns_a_record" {
  for_each = local.dns_a_record

  name                = each.key
  resource_group_name = var.resource_group_name
  zone_name           = local.dns_a_record[each.key].zone_name
  ttl                 = local.dns_a_record[each.key].ttl
  records             = local.dns_a_record[each.key].records

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }
}
# alias records to azure resources
resource "azurerm_dns_a_record" "dns_a_target" {
  for_each = local.dns_a_target

  name                = each.key
  resource_group_name = var.resource_group_name
  zone_name           = local.dns_a_target[each.key].zone_name
  ttl                 = local.dns_a_target[each.key].ttl
  target_resource_id  = local.dns_a_target[each.key].target_resource_id

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }
}

# CNAME Records
resource "azurerm_dns_cname_record" "dns_cname_record" {
  for_each = local.dns_cname_record

  name                = each.key
  resource_group_name = var.resource_group_name
  zone_name           = local.dns_cname_record[each.key].zone_name
  ttl                 = local.dns_cname_record[each.key].ttl
  record              = local.dns_cname_record[each.key].record

  tags = {
    for tag in keys(local.tags) :
    tag => local.tags[tag]
  }
}
