resource "azurerm_network_security_rule" "httpVpnRule" {
    name = "HTTP"
    priority = 220
    direction = "Inbound"
    access = "Allow"
    protocol = "Tcp"
    source_port_range = "*"
    destination_port_range = "80"
    source_address_prefix = "139.59.130.37/32"
    destination_address_prefix = "*"
    resource_group_name = "${azurerm_resource_group.example02.name}"
    network_security_group_name = "${azurerm_network_security_group.example02.name}"
}
