resource "intersight_access_policy" "IMC-ACCESS-POLICY" {
  name = "${var.custom-name}-IMC-ACCESS-POLICY"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }
  organization {
    moid = local.organization
  }

  configuration_type {
    configure_inband      = true
    configure_out_of_band = false
  }

  inband_vlan = var.imc-inband-vlan

  inband_ip_pool {
    moid = intersight_ippool_pool.IP-POOL.id
  }

}