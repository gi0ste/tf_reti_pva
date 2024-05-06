resource "intersight_storage_storage_policy" "STORAGE-POLICY" {
  name = "${var.custom-name}-STORAGE-POLICY"
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

  use_jbod_for_vd_creation = false
  unused_disks_state       = "NoChange"
  default_drive_mode = "UnconfiguredGood"

  m2_virtual_drive {
    enable          = true
    controller_slot = "MSTOR-RAID-1"
  }

}