
resource "azurerm_policy_remediation" "iaasMalwareExtention" {
  name                 = "${var.project_ident}-${var.env_ident}-vm-malware-${var.region_suffix}"
  scope                = var.policy_assignment_scope
  policy_assignment_id = azurerm_policy_assignment.set-assignment-1.id
}