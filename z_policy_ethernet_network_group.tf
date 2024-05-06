##
## This file references two variables that are defined in variables_network.tf
##

resource "intersight_fabric_eth_network_group_policy" "ETH-NET-GROUP-POLICY" {
  name = "${var.custom-name}-ETH-NET-GROUP-POLICY"
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

  vlan_settings {
    native_vlan   = var.native-vlan
    allowed_vlans = var.allowed_vlans
  }

}