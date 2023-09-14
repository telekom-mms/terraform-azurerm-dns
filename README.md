<!-- BEGIN_TF_DOCS -->
# dns

This module manages the hashicorp/azurerm dns resources.
For more information see https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs > dns

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >=1.5 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | >=3.72.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | >=3.72.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| azurerm_dns_a_record.dns_a_record | resource |
| azurerm_dns_cname_record.dns_cname_record | resource |
| azurerm_dns_mx_record.dns_mx_record | resource |
| azurerm_dns_txt_record.dns_txt_record | resource |
| azurerm_dns_zone.dns_zone | resource |
| azurerm_private_dns_zone.private_dns_zone | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dns_a_record"></a> [dns\_a\_record](#input\_dns\_a\_record) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_dns_cname_record"></a> [dns\_cname\_record](#input\_dns\_cname\_record) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_dns_mx_record"></a> [dns\_mx\_record](#input\_dns\_mx\_record) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_dns_txt_record"></a> [dns\_txt\_record](#input\_dns\_txt\_record) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_dns_zone"></a> [dns\_zone](#input\_dns\_zone) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |
| <a name="input_private_dns_zone"></a> [private\_dns\_zone](#input\_private\_dns\_zone) | resource definition, default settings are defined within locals and merged with var settings | `any` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_dns_a_record"></a> [dns\_a\_record](#output\_dns\_a\_record) | Outputs all attributes of resource\_type. |
| <a name="output_dns_cname_record"></a> [dns\_cname\_record](#output\_dns\_cname\_record) | Outputs all attributes of resource\_type. |
| <a name="output_dns_mx_record"></a> [dns\_mx\_record](#output\_dns\_mx\_record) | Outputs all attributes of resource\_type. |
| <a name="output_dns_txt_record"></a> [dns\_txt\_record](#output\_dns\_txt\_record) | Outputs all attributes of resource\_type. |
| <a name="output_dns_zone"></a> [dns\_zone](#output\_dns\_zone) | Outputs all attributes of resource\_type. |
| <a name="output_private_dns_zone"></a> [private\_dns\_zone](#output\_private\_dns\_zone) | Outputs all attributes of resource\_type. |
| <a name="output_variables"></a> [variables](#output\_variables) | Displays all configurable variables passed by the module. __default\_\_ = predefined values per module. \_\_merged__ = result of merging the default values and custom values passed to the module |
<!-- END_TF_DOCS -->
