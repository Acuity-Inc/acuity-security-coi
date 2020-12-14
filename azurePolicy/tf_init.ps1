
# Imports 'deploymentVars.ps1' from repo root, which contains the global variables used in this script
. ..\deploymentVars.ps1

## Login for Mgmt Subscription KeyVault
az login

## Terraform init
  Terraform init
