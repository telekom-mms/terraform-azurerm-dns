module "dns" {
  source = "registry.terraform.io/T-Systems-MMS/dns/azurerm"
  dns_zone = {
    domain_com = {
      name                = "domain.com"
      resource_group_name = "service-infrastructure-rg"
      tags = {
        service = "service_name"
      }
    }
    domain_de = {
      name                = "domain.de"
      resource_group_name = "service-infrastructure-rg"
      tags = {
        service = "service_name"
      }
    }
  }
  private_dns_zone = {
    private_domain_com = {
      name                = "private.domain.com"
      resource_group_name = "service-infrastructure-rg"
      tags = {
        service = "service_name"
      }
    }
  }
  dns_a_record = {
    srv_01 = {
      name                = "srv01.domain.com"
      resource_group_name = "service-infrastructure-rg"
      zone_name           = "domain.com"
      records = [
        "172.16.10.10"
      ]
      tags = {
        service = "service_name"
      }
    }
  }
  dns_cname_record = {
    svc_domain_de = {
      name                = "service"
      resource_group_name = "service-infrastructure-rg"
      zone_name           = "domain.com"
      record              = "service.domain.de"
      tags = {
        service = "service_name"
      }
    }
  }
  dns_txt_record = {
    txt_domain_com = {
      name                = "txt1.domain.com"
      resource_group_name = "service-infrastructure-rg"
      zone_name           = "domain.com"
      record = {
        auth1 = "1234"
        auth2 = "7890"
      }
      tags = {
        service = "service_name"
      }
    }
  }
  dns_mx_record = {
    smtp_domain_com = {
      name                = "smtp.domain.com"
      resource_group_name = "service-infrastructure-rg"
      zone_name           = "domain.com"
      record = {
        preference = 10
        exchange   = "smtp.domain.com"
      }
      tags = {
        service = "service_name"
      }
    }
  }
}
