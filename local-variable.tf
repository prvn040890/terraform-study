locals {
    owner = var.business_name
    environment = var.environment
    name-prefix = "${var.business_name}-${var.environment}"
  common_tags = {
      owner = local.owner
      environment = local.environment
  }

}