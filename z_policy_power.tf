resource "intersight_power_policy" "POWER-POLICY" {
  name = "${var.custom-name}-POWER-POLICY"
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

  redundancy_mode = "Grid"
  power_priority = "Low"
  power_profiling = "Enabled"
  power_restore_state = "AlwaysOff"
  power_save_mode = "Enabled"
}