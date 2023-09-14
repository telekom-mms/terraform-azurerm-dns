module "dns" {
  source = "registry.terraform.io/telekom-mms/dns/azurerm"
  dns_zone = {
    "mms-github-plattform.com" = {
      resource_group_name = "rg-mms-github"
      soa_record = {
        email = "telekom-mms.com"
      }
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
  private_dns_zone = {
    "mms-github-privat-plattform.com" = {
      resource_group_name = "rg-mms-github"
      soa_record = {
        email = "telekom-mms.com"
      }
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
  dns_a_record = {
    "@" = {
      resource_group_name = module.dns.dns_zone["mms-github-plattform.com"].resource_group_name
      zone_name = module.dns.dns_zone["mms-github-plattform.com"].name
      records = ["127.0.0.2"]
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
  dns_cname_record = {
    www = {
      resource_group_name = module.dns.dns_zone["mms-github-plattform.com"].resource_group_name
      zone_name = module.dns.dns_zone["mms-github-plattform.com"].name
      record = module.dns.dns_a_record["@"].fqdn
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
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
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
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
        mail2 = {
          preference = 20
          exchange   = "mail2.telekom-mms.com"
        }
      }
      tags = {
        project     = "mms-github"
        environment = terraform.workspace
        managed-by  = "terraform"
      }
    }
  }
}
