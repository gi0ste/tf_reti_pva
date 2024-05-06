resource "intersight_ippool_pool" "IP-POOL" {
  name = "${var.custom-name}-IP-POOL"
  description = "${var.custom-name} - IP Pool for UCSX RMLAB"
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

  assignment_order = "sequential"

  ip_v4_blocks {
    from = "192.168.100.210"
    size = 15
  }

  ip_v4_config {
    gateway       = "192.168.100.254"
    netmask       = "255.255.255.0"
    primary_dns   = "192.168.100.70"
    secondary_dns = "192.168.100.71"
  }

  lifecycle {
    ignore_changes = [ip_v4_blocks]
  }

}
