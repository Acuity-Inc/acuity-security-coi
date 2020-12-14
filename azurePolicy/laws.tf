
resource "azurerm_log_analytics_workspace" "laws" {
  name                = "${var.project_ident}-${var.env_ident}-laws-${var.region_suffix}"
  location            = azurerm_resource_group.core-rg.location
  resource_group_name = azurerm_resource_group.core-rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}
