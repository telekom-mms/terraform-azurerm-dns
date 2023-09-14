/**
* # dns
*
* This module manages the hashicorp/azurerm dns resources.
* For more information see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs > dns
*
*/

resource "azurerm_dns_zone" "dns_zone" {
  for_each = var.dns_zone

  name                = local.dns_zone[each.key].name == "" ? each.key : local.dns_zone[each.key].name
  resource_group_name = local.dns_zone[each.key].resource_group_name

  dynamic "soa_record" {
    for_each = local.dns_zone[each.key].soa_record == null ? [] : [0]

    content {
      email         = local.dns_zone[each.key].soa_record.email
      host_name     = local.dns_zone[each.key].soa_record.host_name
      expire_time   = local.dns_zone[each.key].soa_record.expire_time
      minimum_ttl   = local.dns_zone[each.key].soa_record.minimum_ttl
      refresh_time  = local.dns_zone[each.key].soa_record.refresh_time
      retry_time    = local.dns_zone[each.key].soa_record.retry_time
      serial_number = local.dns_zone[each.key].soa_record.serial_number
      ttl           = local.dns_zone[each.key].soa_record.ttl
      tags          = local.dns_zone[each.key].soa_record.tags
    }
  }

  tags = local.dns_zone[each.key].tags
}

resource "azurerm_private_dns_zone" "private_dns_zone" {
  for_each = var.private_dns_zone

  name                = local.private_dns_zone[each.key].name == "" ? each.key : local.private_dns_zone[each.key].name
  resource_group_name = local.private_dns_zone[each.key].resource_group_name

  dynamic "soa_record" {
    for_each = local.private_dns_zone[each.key].soa_record == null ? [] : [0]

    content {
      email         = local.private_dns_zone[each.key].soa_record.email
      host_name     = local.private_dns_zone[each.key].soa_record.host_name
      expire_time   = local.private_dns_zone[each.key].soa_record.expire_time
      minimum_ttl   = local.private_dns_zone[each.key].soa_record.minimum_ttl
      refresh_time  = local.private_dns_zone[each.key].soa_record.refresh_time
      retry_time    = local.private_dns_zone[each.key].soa_record.retry_time
      serial_number = local.private_dns_zone[each.key].soa_record.serial_number
      ttl           = local.private_dns_zone[each.key].soa_record.ttl
      tags          = local.private_dns_zone[each.key].soa_record.tags
    }
  }

  tags = local.private_dns_zone[each.key].tags
}

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

resource "azurerm_dns_cname_record" "dns_cname_record" {
  for_each = var.dns_cname_record

  name                = local.dns_cname_record[each.key].name == "" ? each.key : local.dns_cname_record[each.key].name
  resource_group_name = local.dns_cname_record[each.key].resource_group_name
  zone_name           = local.dns_cname_record[each.key].zone_name
  ttl                 = local.dns_cname_record[each.key].ttl
  record              = local.dns_cname_record[each.key].record
  target_resource_id  = local.dns_cname_record[each.key].target_resource_id

  tags = local.dns_cname_record[each.key].tags
}

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

resource "azurerm_dns_mx_record" "dns_mx_record" {
  for_each = var.dns_mx_record

  name                = local.dns_mx_record[each.key].name == "" ? each.key : local.dns_mx_record[each.key].name
  resource_group_name = local.dns_mx_record[each.key].resource_group_name
  zone_name           = local.dns_mx_record[each.key].zone_name
  ttl                 = local.dns_mx_record[each.key].ttl

  dynamic "record" {
    for_each = local.dns_mx_record[each.key].record

    content {
      preference = local.dns_mx_record[each.key].record[record.key].preference
      exchange   = local.dns_mx_record[each.key].record[record.key].exchange
    }
  }

  tags = local.dns_mx_record[each.key].tags
}
