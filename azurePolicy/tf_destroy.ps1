
# Imports 'deploymentVars.ps1' from repo root, which contains the global variables used in this script
. ..\deploymentVars.ps1

## Login for Mgmt Subscription KeyVault
az login

# Execute Terraform configuration
terraform destroy `
-var "tenant_id=$tenant_Id" `
-var "subscription_Id=$subscription_Id" `
-var "project_ident=$projectPrefix" `
-var "region=$azRegion" `
-var "region_suffix=$regionSuffix" `
-var "env_ident=$envIdentifier" `
-var "policy_assignment_scope=$rgScope"

