##
##  Cisco suggests using MAC OUI of 00:25:B5
##

# This is a perfectly reasonable MAC pool.  It's important to verify that the addresses in this pool
# are not configured in any other UCS Manager systems in the same environment.  MAC addresses really
# should be globally unique in your infrastructure.
resource "intersight_macpool_pool" "MAC-POOL" {
  name = "${var.custom-name}-MAC-POOL"
  description = "${var.custom-name} - MAC Pool for UCSX RMLAB"
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

  mac_blocks {
    from = "00:25:B5:AA:CC:00"
    size = 256
  }

  lifecycle {
    ignore_changes = [mac_blocks]
  }

}
