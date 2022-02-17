<!-- BEGIN_TF_DOCS -->
# dns

This module manages Azure DNS Zones.

<-- This file is autogenerated, please do not change. -->

## Requirements

| Name | Version |
|------|---------|
| terraform | >=0.12 |
| azurerm | >=2.19.0 |

## Providers

| Name | Version |
|------|---------|
| azurerm | >=2.19.0 |

## Resources

| Name | Type |
|------|------|
| azurerm_dns_a_record.dns_a_record | resource |
| azurerm_dns_cname_record.dns_cname_record | resource |
| azurerm_dns_txt_record.dns_txt_record | resource |
| azurerm_dns_zone.dns_zone | resource |
| azurerm_private_dns_zone.private_dns_zone | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| dns_a_record | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| dns_cname_record | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| dns_txt_record | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| dns_zone | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| private_dns_zone | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| dns_zone | azurerm_dns_zone results |

## Examples

```hcl
module "dns" {
  source = "registry.terraform.io/T-Systems-MMS/dns/azurerm"
  dns_zone = {
    domain_com = {
      name                = "domain.com"
      resource_group_name = "service-infrastructure-rg"
    }
    domain_de = {
      name                = "domain.de"
      resource_group_name = "service-infrastructure-rg"
    }
  }
}
```
<!-- END_TF_DOCS -->
