
variable "project_ident" {
  description = "2 or 3 letter project identifier"
}

variable "env_ident" {
  description = "Identifier for target environment such as dev, test, prod"
}

variable "subscription_Id" {
  description = "The ID of the subscription to deploy into"
}

variable "tenant_id" {
  description = "The ID of the tenant to deploy into"
}

variable "core_rg_name" {
  description = "Name of the resource group to deploy develop stack into"
  default     = "core-rg"
}

variable "region" {
  description = "Name of the Azure Region to provision resources in"
}

variable "region_suffix" {
  description = "Name of the resource group to deploy develop stack into"
}

variable "effectDeny" {
  description = "(optional) describe your variable"
  default     = "Deny"
}

variable "policy_assignment_scope" {
}

variable "allowedRegions" {
  description = "allowed regions for provisioning"
  default = [
    "eastus",
    "eastus2",
    "westus",
    "westus2",
    "centralus",
    "global",
    "northcentralus",
    "southcentralus",
    "westcentralus"
  ]
}

variable "allowedServices" {
  description = "allowed services via the subscription resource providers"
  type = list
  default = [
    "Microsoft.Compute/virtualMachines",
    "Microsoft.Compute/disks",
    "Microsoft.Compute/images",
    "Microsoft.Compute/virtualMachines/extensions",
    "Microsoft.Resources/deployments",
    "Microsoft.Insights",
    "Microsoft.Insights/components",
    "Microsoft.Insights/actionGroups",
    "Microsoft.Insights/activityLogAlerts",
    "Microsoft.insights/scheduledQueryRules",
    "Microsoft.Network/networkInterfaces",
    "Microsoft.Network/publicIPAddresses",
    "Microsoft.Network/virtualNetworks",
    "Microsoft.Network/subnets",
    "Microsoft.Network/networkSecurityGroups",
    "Microsoft.OperationalInsights",
    "Microsoft.OperationalInsights/workspaces", 
    "Microsoft.Portal/dashboards",
    "Microsoft.Storage/storageAccounts",
    "Microsoft.Sql/servers",
    "Microsoft.Sql/servers/databases",
    "Microsoft.Web/sites", 
    #"Microsoft.KeyVault/vaults",
  ]
}
