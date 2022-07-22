/**
 * # dns
 *
 * This module manages Azure DNS Zones.
 *
*/

/** DNS Zone */
resource "azurerm_dns_zone" "dns_zone" {
  for_each = var.dns_zone

  name                = local.dns_zone[each.key].name == "" ? each.key : local.dns_zone[each.key].name
  resource_group_name = local.dns_zone[each.key].resource_group_name

  tags = local.dns_zone[each.key].tags
}

/** Private DNS Zone */
resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each = var.private_dns_zone

  name                = local.private_dns_zone[each.key].name == "" ? each.key : local.private_dns_zone[each.key].name
  resource_group_name = local.private_dns_zone[each.key].resource_group_name

  tags = local.private_dns_zone[each.key].tags
}

/** A Records */
resource "azurerm_dns_a_record" "dns_a_record" {
  for_each = var.dns_a_record

  name                = local.dns_a_record[each.key].name == "" ? each.key : local.dns_a_record[each.key].name
  resource_group_name = local.dns_a_record[each.key].resource_group_name
  zone_name           = local.dns_a_record[each.key].zone_name
  ttl                 = local.dns_a_record[each.key].ttl
  records             = local.dns_a_record[each.key].records
  target_resource_id  = local.dns_a_record[each.key].target_resource_id

  tags = local.dns_a_record[each.key].tags
}

/** CNAME Records */
resource "azurerm_dns_cname_record" "dns_cname_record" {
  for_each = var.dns_cname_record

  name                = local.dns_cname_record[each.key].name == "" ? each.key : local.dns_cname_record[each.key].name
  resource_group_name = local.dns_cname_record[each.key].resource_group_name
  zone_name           = local.dns_cname_record[each.key].zone_name
  ttl                 = local.dns_cname_record[each.key].ttl
  record              = local.dns_cname_record[each.key].record

  tags = local.dns_cname_record[each.key].tags
}


/** TXT Records */
resource "azurerm_dns_txt_record" "dns_txt_record" {
  for_each = var.dns_txt_record

  name                = local.dns_txt_record[each.key].name == "" ? each.key : local.dns_txt_record[each.key].name
  resource_group_name = local.dns_txt_record[each.key].resource_group_name
  zone_name           = local.dns_txt_record[each.key].zone_name
  ttl                 = local.dns_txt_record[each.key].ttl

  dynamic "record" {
    for_each = local.dns_txt_record[each.key].record
    content {
      value = local.dns_txt_record[each.key].record[record.key].value
    }
  }

  tags = local.dns_txt_record[each.key].tags
}

/** MX Records */
resource "azurerm_dns_mx_record" "dns_mx_record" {
  for_each = var.dns_mx_record

  name                = local.dns_mx_record[each.key].name == "" ? each.key : local.dns_mx_record[each.key].name
  resource_group_name = local.dns_mx_record[each.key].resource_group_name
  zone_name           = local.dns_mx_record[each.key].zone_name
  ttl                 = local.dns_mx_record[each.key].ttl

  record {
    preference  = local.dns_mx_record[each.key].record.preference
    exchange = local.dns_mx_record[each.key].record.exchange
  }

  tags = local.dns_mx_record[each.key].tags
}
