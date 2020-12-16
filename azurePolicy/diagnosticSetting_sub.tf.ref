
# "Azure Subscription" Diagnostic Settings
resource "azurerm_monitor_diagnostic_setting" "sub" {
  name                       = "${var.project_ident}-${var.env_ident}-sub-${var.region_suffix}"
  target_resource_id         = data.azurerm_subscription.current.id
  log_analytics_workspace_id = azurerm_log_analytics_workspace.laws.id
  depends_on                 = [azurerm_log_analytics_workspace.laws]

  log {
      category = "Administrative"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
    }
  log {
      category = "Security"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }
  log {
      category = "ServiceHealth"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }
  log {
      category = "Alert"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }
  log {
      category = "Recommendation"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }
  log {
      category = "Policy"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }
  log {
      category = "Autoscale"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }
  log {
      category = "ResourceHealth"
      enabled  = true

      retention_policy {
      enabled = true
      days    = 30
      }
  }

  metric {
    category = "AllMetrics"

    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
