
resource "azurerm_policy_definition" "regions" {
  name         = "${var.project_ident}-${var.env_ident}-allowed-regions"
  policy_type  = "Custom"
  mode         = "Indexed"
  display_name = "${var.project_ident}-${var.env_ident}-allowed-regions"

  metadata = <<METADATA
    {
    "category": "General"
    }
METADATA

  policy_rule = <<POLICY_RULE
    {
    "if": {
      "not": {
        "field": "location",
        "in": "[parameters('allowedRegions')]"
      }
    },
    "then": {
      "effect": "deny"
    }
  }
POLICY_RULE

  parameters = <<PARAMETERS
    {
    "allowedRegions": {
      "type": "Array",
      "metadata": {
        "description": "The list of allowed locations for resources.",
        "displayName": "allowed regions",
        "strongType": "location"
      }
    }
  }
PARAMETERS
}
