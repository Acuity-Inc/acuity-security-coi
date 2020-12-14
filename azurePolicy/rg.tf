
resource "azurerm_resource_group" "core-rg" {
  name     = "${var.project_ident}-${var.env_ident}-${var.core_rg_name}-${var.region_suffix}"
  location = var.region

    tags  = {
      owner       = "${var.project_ident}-${var.env_ident}"
    }
}
