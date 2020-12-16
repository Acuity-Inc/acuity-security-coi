
##  NOTICE: These scripts assume that you have enough rights in the selected Azure Subscription to create:
- # Resource groups
- # Storage Accounts
- # Storage Account containers
- # Virtual Machines
- # LogAnalytics Workspace
- # Azure Policies on ResourceGroup

## Extra capabilities if subscription level rights are optainable
- # Azure Monitor Scheduled Query Rules Alert
- # Azure Monitor Action Groups
- # Subscription DiagnosticSettings

## To run the scripts in this repository, it is required that your enviornment have the following tools installed on your machine:
- # Terraform 13 or higher
  - # https://www.terraform.io/downloads.html

- # Powershell 
  - # Window machines
    - # Windows Powershell <= 5.1 Comes pre-installed on Windows Machines
  - # Linux / MacOS Machines
    - # Powershell Core >= 7.0
    - # Cross Platform version of Powershell (Windows, Linux, MacOS)
        - # https://docs.microsoft.com/en-us/powershell/scripting/install/installing-powershell?view=powershell-7.1

- # Azure CLI
  - # https://docs.microsoft.com/en-us/cli/azure/install-azure-cli

## To View the repository and its files as shown in the demo, download the following CODE integrated development environment (IDE)
- # Visual Studio Code (VS Code)
  - # https://code.visualstudio.com/

## Steps to replicate results shows in COI Demo:
# 1) Open Powershell as an administrator
- # Type 'Powershell' in the start menu
- # Right Click 'Powershell' or 'Powershell 7', and select 'Run as administrator'

# 2) Clone Git Repository to the 'desktop' 
cd ~

cd 'desktop'

git clone https://github.com/Acuity-Inc/acuity-security-coi.git

# 2) Open new desktop clone folder in VS Code, or other code view software
# - File 'Add Folder to Workspace'
# - Select 'Desktop\acuity-security-coi'

# 3) Navigate to 'deploymentVars.ps1' variables file
cd ~

cd 'desktop/acuity-security-coi'

ls

# 4) Open the 'deploymentVars.ps1' file 
deploymentVars.ps1

# 5) Enter in desired values for each variable
- # $tenant_id
- # $subscription_Id
- # $subIdentifier
- # $environment  
- # $projectPrefix
- # $envIdentifier 
- # $azRegion  
- # $regionSuffix

# 6) Change directory into 'azurePolicy' folder
cd ~

cd 'desktop/acuity-security-coi/azurePolicy'

# 7) Run the deployment script, which will run each of the below scripts, at one time, in the proper order
./deployScript.ps1

  # Each script can be run individually, in the following order, rather than using the 'deployScript'
  - # tf_init.ps1
  - # tf_validate.ps1
  - # tf_plan.ps1
  - # tf_apply.ps1

## To delete all resources created by this deployment
# 1) Run Terraform Destroy script
cd ~

cd 'desktop/acuity_security_coi_demo/azurePolicy'

.\tf_destroy.ps1






