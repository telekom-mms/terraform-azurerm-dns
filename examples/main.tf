module "dns_zone" {
  source              = "../terraform-dns"
  resource_group_name = "service-infrastructure-rg"
  dns_zone            = {
    domain_com = "domain.com"
    domain_de  = "domain.de"
  }
}
