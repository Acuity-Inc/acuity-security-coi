
resource "azurerm_policy_definition" "services" {
  name         = "${var.project_ident}-${var.env_ident}-allowed-services"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "${var.project_ident}-${var.env_ident}-allowed-services"

  metadata = <<METADATA
    {
    "category": "General" 
    }
METADATA

  policy_rule = <<POLICY_RULE
    {
    "if": {
      "not": {
        "field": "type",
        "in": "[parameters('allowedServices')]"
      }
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE

  parameters = <<PARAMETERS
    {
    "allowedServices": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed services for subscriptions.",
        "displayName": "allowed services",
        "strongType": "resourceTypes"
      }
    }
  }
PARAMETERS
}
