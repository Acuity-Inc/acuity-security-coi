
# Variables used through out this deployment
$tenant_id              = '2636bcf7-dafd-43a0-ac97-e92b4947ea04'
$subscription_Id        = '31808d7a-bb2f-48ea-882a-bcc4489e7b31'
$environment            = "AzureCloud" # Get-AzureRmEnvironment | Select-Object Name
$projectPrefix          = 'coi'
$envIdentifier          = "demo"
$azRegion               = 'eastus' 
$regionSuffix           = "eus"

# Variables with no input required, created using the above variables via 'concatination'
$tf_state_rg            = "$projectPrefix-$envIdentifier-core-rg-$regionSuffix"
$tf_state_sa_sku        = 'Standard_RAGRS'
$tf_state_sa_name       = $projectPrefix + $envIdentifier + $subIdentifier + "tf" + $regionSuffix
$tf_state_sa_container  = "$projectPrefix-$envIdentifier-terraform-state"

# Choose the desired scope for Azure Policy Assignment
$rgScope                = "/subscriptions/$subscription_Id/ResourceGroups/$tf_state_rg"
#$mgScope               = "/providers/Microsoft.Management/managementGroups/$mgmtGroupName" 
#$subScope              = "/subscriptions/$subscription_Id" 
 