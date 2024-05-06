resource "intersight_vnic_eth_qos_policy" "ETH-QOS-POLICY" {
  name = "${var.custom-name}-ETH-QOS-POLICY"
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

  mtu            = 1500
  rate_limit     = 0
  cos            = 0
  burst          = 10240
  priority       = "Best Effort"
  trust_host_cos = false
}
