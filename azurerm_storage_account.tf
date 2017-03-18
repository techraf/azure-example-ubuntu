resource "random_id" "example02" {
   byte_length = 3
}

resource "azurerm_storage_account" "example02" {
    # Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
    name = "${format("%s%s", var.azurerm_storage_account_name_fixed_prefix, random_id.example02.hex)}"
    resource_group_name = "${azurerm_resource_group.example02.name}"
    location = "${var.azure_resource_group_location}"
    account_type = "${var.azurerm_storage_account_account_type}"
}
