resource "azurerm_resource_group" "terraform-rg" {
  name     = "${local.name-prefix}-${var.resource_group_name}-${random_string.terraform-rand-id.id}"
  location = var.resource_group_location
  tags = local.common_tags
}