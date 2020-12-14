
##  NOTICE: These scripts assume that you have enough rights in the selected Azure Subscription to create:
 - # Resource groups
 - # Storage Accounts
 - # Storage Account containers
 - # Virtual Machines
 - # LogAnalytics Workspace
 - # Azure Policies on ResourceGroup
 - # Azure Monitor Scheduled Query Rules Alert
 - # Azure Monitor Action Groups
 - # Subscription DiagnosticSettings

## To use the scripts in this repository, it is required that your enviornment have the following tools installed on your machine:
- # Terraform 13 or higher
  - # https://www.terraform.io/downloads.html

- # Powershell Core (7.0 or higher)
  - # https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1

- # Azure CLI
  - # https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

## Steps to replicate results shows in COI Demo:
# 1) Clone Git Repository to the 'desktop' 
cd ~
cd 'desktop'
git clone https://github.com/Acuity-Inc/acuity-security-coi.git

# 2) Navigate to 'deploymentVars.ps1' file
cd ~
cd 'desktop/acuity-security-coi/azurePolicy/deploymentVars.ps1
# 3) Enter in desired values for each variable
  - $tenant_id
  - $subscription_Id
  - $subIdentifier
  - $environment  
  - $projectPrefix
  - $envIdentifier 
  - $azRegion  
  - $regionSuffix

# 4) Open Powershell as an administrator
# 5) Change directory into 'azurePolicy'
cd ~
cd 'desktop/acuity-security-coi/azurePolicy

# 6) Run the deployment script, which run each of the below scripts at one time
./deployScript.ps1

# Each of the below script can be run in order, individually, rather than using the 'deployScript'
- # tf_init.ps1
- # tf_validate.ps1
- # tf_plan.ps1
- # tf_apply.ps1

## To delete all resources created in this deployment
# 1) Deletes resources created by Terraform
cd ~
cd 'desktop/acuity_security_coi_demo/azurePolicy'
.\tf_destroy.ps1






