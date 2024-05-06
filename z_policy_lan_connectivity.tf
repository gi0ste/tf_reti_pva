resource "intersight_vnic_lan_connectivity_policy" "LAN-CONNECTIVITY-POLICY" {
  name = "${var.custom-name}-LAN-CONNECTIVITY-POLICY"
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

  placement_mode  = "auto"
  target_platform = "FIAttached"
}

resource "intersight_vnic_eth_if" "VNIC0" {
  name = "vnic0"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  order            = 0
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.MAC-POOL.moid
  }

  placement {
    switch_id = "A"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.ETH-NET-GROUP-POLICY.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.ETH-NET-CTRL-POLICY.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.ETH-QOS-POLICY.moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ETH-ADAPTER-POLICY.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  failover_enabled = false

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.LAN-CONNECTIVITY-POLICY.moid
  }

}

resource "intersight_vnic_eth_if" "VNIC1" {
  name = "vnic1"
  dynamic "tags" {
    for_each = local.tags
    content {
      key   = tags.key
      value = tags.value
    }
  }

  order            = 1
  mac_address_type = "POOL"

  mac_pool {
    moid = intersight_macpool_pool.MAC-POOL.moid
  }

  placement {
    switch_id = "B"
  }

  cdn {
    nr_source = "vnic"
  }

  fabric_eth_network_group_policy {
    moid = intersight_fabric_eth_network_group_policy.ETH-NET-GROUP-POLICY.moid
  }

  fabric_eth_network_control_policy {
    moid = intersight_fabric_eth_network_control_policy.ETH-NET-CTRL-POLICY.moid
  }

  eth_qos_policy {
    moid = intersight_vnic_eth_qos_policy.ETH-QOS-POLICY.moid
  }

  eth_adapter_policy {
    moid = intersight_vnic_eth_adapter_policy.ETH-ADAPTER-POLICY.moid
  }

  lifecycle {
    ignore_changes = [cdn]
  }

  failover_enabled = false

  lan_connectivity_policy {
    moid = intersight_vnic_lan_connectivity_policy.LAN-CONNECTIVITY-POLICY.moid
  }

}
