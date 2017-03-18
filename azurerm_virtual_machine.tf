resource "random_id" "random_password" {
  byte_length = 8
}

resource "azurerm_virtual_machine" "example02" {
    name = "${var.azurerm_virtual_machine_name}"
    location = "${var.azure_resource_group_location}"
    resource_group_name = "${azurerm_resource_group.example02.name}"
    network_interface_ids = ["${azurerm_network_interface.example02.id}"]
    vm_size = "${var.azurerm_virtual_machine_size}"

    storage_image_reference {
        publisher = "${var.azurerm_virtual_machine_storage_image_reference_publisher}"
        offer = "${var.azurerm_virtual_machine_storage_image_reference_offer}"
        sku = "${var.azurerm_virtual_machine_storage_image_reference_sku}"
        version = "${var.azurerm_virtual_machine_storage_image_reference_version}"
    }

    storage_os_disk {
        name = "myosdisk1"
        vhd_uri = "${azurerm_storage_account.example02.primary_blob_endpoint}${azurerm_storage_container.example02.name}/myosdisk1.vhd"
        caching = "ReadWrite"
        create_option = "FromImage"
    }

    os_profile {
        computer_name = "${var.azurerm_virtual_machine_name}"
        admin_username = "${var.azurerm_virtual_machine_os_profile_admin_username}"
        admin_password = "${format("%s%s", var.azurerm_virtual_machine_os_profile_admin_password_prefix, random_id.random_password.b64)}"
    }

    os_profile_linux_config {
        disable_password_authentication = true

        ssh_keys {
            path     = "${format("/home/%s/.ssh/authorized_keys", var.azurerm_virtual_machine_os_profile_admin_username)}"
            key_data = "${file(var.ssh_public_keyfile)}"
        }
    }

    provisioner "local-exec" {
        command = "cd ./ansible && ansible-playbook -i inventory playbook.yml"
    }
}
