
# Example: Alerting Action Cross-Resource
resource "azurerm_monitor_scheduled_query_rules_alert" "example2" {
  name                = "${var.project_ident}-${var.env_ident}-missing-vm-extension-${var.region_suffix}"
  location            = azurerm_resource_group.core-rg.location
  resource_group_name = azurerm_resource_group.core-rg.name
  depends_on          = [azurerm_policy_assignment.set-assignment-1]

  action {
    action_group           = [azurerm_monitor_action_group.email-alerts.id]
    email_subject          = "Missing VM Malware Extension"
  }

  data_source_id = azurerm_log_analytics_workspace.laws.id
  description    = "Query may access data within multiple resources"
  enabled        = true
  # Count requests in multiple log resources and group into 5-minute bins by HTTP operation
  query       = <<-QUERY
  AzureActivity 
  | where Category == 'Policy' and Level != 'Informational' 
  | extend p=todynamic(Properties) 
  | extend policies=todynamic(tostring(p.policies)) 
  | mvexpand policy = policies 
  | where p.isComplianceCheck == 'False'
QUERY
  frequency   = 5
  time_window = 30

  trigger {
    operator  = "Equal"
    threshold = 1
  }
}