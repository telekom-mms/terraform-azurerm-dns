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
