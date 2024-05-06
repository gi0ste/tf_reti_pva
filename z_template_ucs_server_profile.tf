resource "intersight_server_profile_template" "UCS-SERVER-TEMPLATE" {
  name = "${var.custom-name}-UCSX-TEMPLATE"
  description = "SPT for a sample UCSX Servers"
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

  target_platform   = "FIAttached"
  uuid_address_type = "POOL"

  uuid_pool {
    moid = intersight_uuidpool_pool.UUID-POOL.moid
  }

  ### 
  ### Compute Configuration
  ###


  policy_bucket { # Boot Order
    moid        = intersight_boot_precision_policy.BOOT-ORDER-POLICY.moid
    object_type = intersight_boot_precision_policy.BOOT-ORDER-POLICY.object_type
  }

  policy_bucket { # Power
    moid        = intersight_power_policy.POWER-POLICY.moid
    object_type = intersight_power_policy.POWER-POLICY.object_type
  }

  policy_bucket { # Virtual Media
    moid        = intersight_vmedia_policy.VMEDIA-POLICY.moid
    object_type = intersight_vmedia_policy.VMEDIA-POLICY.object_type
  }

  ###
  ### Management Configuration
  ###
  #   policy_bucket { # Certificate Management
  #     moid        = ""
  #     object_type = ""
  #   }

  policy_bucket { # IMC Access
    moid        = intersight_access_policy.IMC-ACCESS-POLICY.moid
    object_type = intersight_access_policy.IMC-ACCESS-POLICY.object_type
  }

  policy_bucket { # Virtual KVM
    moid        = intersight_kvm_policy.VIRTUAL-KVM-POLICY.moid
    object_type = intersight_kvm_policy.VIRTUAL-KVM-POLICY.object_type
  }

  ###
  ### Storage Configuration
  ###
  #   policy_bucket { # SD Card
  #     moid        = ""
  #     object_type = ""
  #   }

  policy_bucket { # Storage
    moid        = intersight_storage_storage_policy.STORAGE-POLICY.moid
    object_type = intersight_storage_storage_policy.STORAGE-POLICY.object_type
  }

  ###
  ### Network Configuration
  ###
  policy_bucket { # LAN Connectivity
    moid        = intersight_vnic_lan_connectivity_policy.LAN-CONNECTIVITY-POLICY.moid
    object_type = intersight_vnic_lan_connectivity_policy.LAN-CONNECTIVITY-POLICY.object_type
  }

}
