resource "intersight_boot_precision_policy" "BOOT-ORDER-POLICY" {
  name = "${var.custom-name}-BOOT-ORDER-POLICY"
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

  configured_boot_mode     = "Uefi"
  enforce_uefi_secure_boot = false

  boot_devices {
    enabled     = true
    name        = "vdrive0"
    object_type = "boot.LocalDisk"
    additional_properties = jsonencode({
      Slot = "MSTOR-RAID"
    })
  }

  boot_devices {
    enabled     = true
    name        = "CIMC-DVD"
    object_type = "boot.VirtualMedia"
    additional_properties = jsonencode({
      Subtype = "cimc-mapped-dvd"
    })
  }
}
