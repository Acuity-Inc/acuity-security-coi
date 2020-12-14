
resource "azurerm_monitor_action_group" "email-alerts" {
  name                = "${var.project_ident}-${var.env_ident}-email-alerts-${var.region_suffix}"
  resource_group_name = azurerm_resource_group.core-rg.name
  short_name          = "email"
  depends_on          = [azurerm_policy_assignment.set-assignment-1]

  email_receiver {
    name                    = "SendToSecurityTeam"
    email_address           = "gianni.vazzana@myacuity.com"
  }
}