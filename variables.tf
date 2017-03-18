variable "azure_resource_group_name" { default = "terra02rg" }
variable "azure_resource_group_location" { default = "South Central US" }

# Storage account names must be between 3 and 24 characters in length and use numbers and lower-case letters only.
variable "azurerm_storage_account_name_fixed_prefix" { default = "terra02sg" }
variable "azurerm_storage_account_account_type" { default = "Standard_LRS" }

variable "azurerm_storage_container_name" { default = "vhds" }
variable "azurerm_storage_container_container_access_type" { default = "private" }

variable "azurerm_subnet_name" { default = "terra02sub" }
variable "azurerm_subnet_address_prefix" { default = "10.0.2.0/24" }

variable "azurerm_network_interface_name" { default = "terra02ni" }
variable "azurerm_network_interface_ip_configuration_name" { default = "testconfiguration1" }
variable "azurerm_network_interface_ip_configuration_private_ip_address_allocation" { default = "dynamic" }

variable "azurerm_public_ip_name" { default = "terra02pubip" }
variable "azurerm_public_ip_public_ip_address_allocation" { default = "dynamic" }
variable "azurerm_public_ip_domain_name_label" { default = "terra02vm" }

variable "azurerm_virtual_network_name" { default = "terra02vn" }
variable "azurerm_virtual_network_address_space" { default = ["10.0.0.0/16"] }

variable "azurerm_virtual_machine_name" { default = "terra02vm" }
variable "azurerm_virtual_machine_size" { default = "Standard_A2" }
variable "azurerm_virtual_machine_storage_image_reference_publisher" { default = "Canonical" }
variable "azurerm_virtual_machine_storage_image_reference_offer" { default = "UbuntuServer" }
variable "azurerm_virtual_machine_storage_image_reference_sku" { default = "16.04.0-LTS" }
variable "azurerm_virtual_machine_storage_image_reference_version" { default = "latest" }
variable "azurerm_virtual_machine_os_profile_admin_username" { default = "terrabuntu" }
variable "azurerm_virtual_machine_os_profile_admin_password_prefix" { default = "UnSaFe**123!" }

variable "security_rule_enabled_ip_address" { description = "Or define with `export TF_VAR_security_rule_enabled_ip_address=192.168.1.1`" }

variable "ssh_public_keyfile" { default = "~/.ssh/id_rsa.pub" }
