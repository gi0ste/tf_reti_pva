##
## These variables need to be provided by tfvars or by variables in Terraform Cloud.
##


variable "custom-name" {
  description = "Custom name to associate"
  type = string
  default = "RETI"
}

variable "imc-inband-vlan" {
  description = "VLAN for In Band IMC Access"
  type = number
  default = 100
}

variable "native-vlan" {
  description = "Native VLAN for sample UCSX"
  type = number
  default = 100
}

variable "allowed_vlans" {
  description = "Allowed Uplink VLANs on sample X-Series Servers"
  type = string
  default = "100,110,120,130"
}
