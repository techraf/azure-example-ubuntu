resource "azurerm_resource_group" "example02" {
    name = "${var.azure_resource_group_name}"
    location = "${var.azure_resource_group_location}"
}
