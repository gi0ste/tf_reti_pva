terraform {
  required_providers {
    intersight = {
      source = "CiscoDevNet/intersight"
      version = "1.0.41"
    }
  }
}

provider "intersight" {
  apikey    = "API_KEY"
  secretkey = file("./secret-key-pva.key")
  endpoint = "https://PVA_ADDRESS"
}