module "dns" {
  source           = "../terraform-dns"
  dns_zone            = {
    domain_com  = {
      name = "domain.com"
      resource_group_name = "service-infrastructure-rg"
    }
    domain_de  = {
      name = "domain.de"
      resource_group_name = "service-infrastructure-rg"
    }
  }
}
