module "dns" {
  source = "registry.terraform.io/telekom-mms/dns/azurerm"
  dns_zone = {
    "mms-github-plattform.com" = {
      resource_group_name = "rg-mms-github"
    }
  }
  private_dns_zone = {
    "mms-github-privat-plattform.com" = {
      resource_group_name = "rg-mms-github"
    }
  }
  dns_a_record = {
    "@" = {
      resource_group_name = module.dns.dns_zone["mms-github-plattform.com"].resource_group_name
      zone_name = module.dns.dns_zone["mms-github-plattform.com"].name
      records = ["127.0.0.2"]
    }
  }
  dns_cname_record = {
    www = {
      resource_group_name = module.dns.dns_zone["mms-github-plattform.com"].resource_group_name
      zone_name = module.dns.dns_zone["mms-github-plattform.com"].name
      record = module.dns.dns_a_record["@"].fqdn
    }
  }
  dns_txt_record = {
    dnsauth = {
      resource_group_name = module.dns.dns_zone["mms-github-plattform.com"].resource_group_name
      zone_name = module.dns.dns_zone["mms-github-plattform.com"].name
      record = {
        frontdoor = {
          value = "frontdoor"
        }
      }
    }
  }
  dns_mx_record = {
    mail = {
      resource_group_name = module.dns.dns_zone["mms-github-plattform.com"].resource_group_name
      zone_name = module.dns.dns_zone["mms-github-plattform.com"].name
      record = {
        mail1 = {
          preference = 10
          exchange   = "mail1.telekom-mms.com"
        }
      }
    }
  }
}
