
resource "azurerm_policy_assignment" "set-assignment-1" {
  name                 = "${var.project_ident}-${var.env_ident}-sec-controls" 
  scope                = var.policy_assignment_scope
  description          = "policy set definition assignment to specified management groups"
  display_name         = "${var.project_ident}-${var.env_ident}-sec-controls"
  policy_definition_id = azurerm_policy_set_definition.policy-set-1.id
  identity { type = "SystemAssigned" }
  location             = azurerm_resource_group.core-rg.location
  
  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "value": ${jsonencode(var.allowedRegions)}
    },
    "allowedServices": {
      "value": ${jsonencode(var.allowedServices)}
    },
    "storageAccountsResourceGroup": {
      "value": "${azurerm_resource_group.core-rg.name}"
    }
}
PARAMETERS
}