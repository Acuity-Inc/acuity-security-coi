
# Initialize the directory
./tf_init.ps1

# Perform TF Validate, for syntax and linting checks
./tf_validate.ps1

# Perfom TF Plan, and out to file 'tfplan'
./tf_plan.ps1

# Perform TF Apply based on 'tfplan' file
./tf_apply.ps1