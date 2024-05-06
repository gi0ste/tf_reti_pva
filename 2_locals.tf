locals {
  # this value is converted to tags on each object and additional tags can be added easily
  tags = {
    Automation = "Terraform"
    owner = "sgioia"
  }
  # Here we choose the organization where our TF configuration should live
  organization = data.intersight_organization_organization.default.results[0].moid
}
