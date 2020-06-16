provider "azurerm" {
    version = "~> 2"
    features {}

    subscription_id = var.subscription_id
    client_id       = var.client_id
    client_secret   = var.client_secret
    tenant_id       = var.tenant_id

}
data "azurerm_subscription" "primary" {
}

resource "azurerm_role_assignment" "main" {
    scope                   = data.azurerm_subscription.primary.id
    role_definition_name    = var.role_definition_name
    principal_id            = var.service_principal_object_id
}



