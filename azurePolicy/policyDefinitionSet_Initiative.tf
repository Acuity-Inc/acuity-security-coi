
resource "azurerm_policy_set_definition" "policy-set-1" {
  name         = "${var.project_ident}-${var.env_ident}-sec-controls"
  policy_type  = "Custom"
  display_name = "${var.project_ident}-${var.env_ident}-sec-controls"
  
  parameters = <<PARAMETERS
    {
      "allowedRegions": {
        "type": "Array",
        "metadata": {
          "description": "The list of allowed locations for resources.",
          "displayName": "allowed regions",
          "strongType": "location"
        }
      },
      "allowedServices": {
        "type": "Array",
        "metadata": {
          "description": "The list of allowed services for subscriptions.",
          "displayName": "allowed services",
          "strongType": "resourceTypes"
        }
      },
      "retentionDays": {
        "type": "String",
        "metadata": {
          "description": "The value in days of the retention period (0 indicates unlimited retention)",
          "displayName": "Retention days (optional, 180 days if unspecified)"
        },
        "defaultValue": "180"
      },
      "storageAccountsResourceGroup": {
        "type": "String",
        "metadata": {
          "displayName": "Resource group name for storage accounts",
          "description": "Auditing writes database events to an audit log in your Azure Storage account (a storage account will be created in each region where a SQL Server is created that will be shared by all servers in that region). Important - for proper operation of Auditing do not delete or rename the resource group or the storage accounts.",
          "strongType": "existingResourceGroups"
        }
      }
    }
PARAMETERS

# 'DeployifNotexist' will enforce the configuration on first creation
# To continue enforcing configuration, a Remediation Task should be created, and set up on a schedule via Azure Automation or other mechanizm

  # Built-In: 'DeployifNotexist' Deploy SQL DB transparent data encryption
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/86a912f6-9a06-4e26-b447-11b16ba8659f"
    #reference_id = uuid()
  }

  # Built-In: 'DeployifNotexist' Deploy Auditing on SQL servers
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/f4c68484-132f-41f9-9b6d-3e4b1cb55036"
    #reference_id = uuid()
    parameters = {
      retentionDays = "[parameters('retentionDays')]"
      storageAccountsResourceGroup = "[parameters('storageAccountsResourceGroup')]"
    }
  }

  # Built-In: 'DeployifNotexist' Deploy default Microsoft IaaSAntimalware extension for Windows Server
  policy_definition_reference {
    policy_definition_id =  "/providers/Microsoft.Authorization/policyDefinitions/2835b622-407b-4114-9198-6f7064cbe0dc"
    #reference_id = uuid()
  }

  # Custom: Allowed Regions per customers subscription (Locations)
  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.regions.id
    #reference_id = uuid()
    parameters = {
      allowedRegions = "[parameters('allowedRegions')]"
    }
  }

  # Custom: Allowed Services (ResourceTypes)
  policy_definition_reference {
    policy_definition_id = azurerm_policy_definition.services.id
    #reference_id = uuid()
    parameters = {
      allowedServices = "[parameters('allowedServices')]"
    }
  }
}
