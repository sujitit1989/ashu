
  resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = var.subnet_id
    private_ip_address_allocation = "Dynamic"
    private_ip_address_version = "IPv4"  
     public_ip_address_id          = var.pip_id #yahaan pr public ip ka id dena hai ye registory pe diya hai ip_configuration ke niche dena hai
     }
}

resource "azurerm_linux_virtual_machine" "VM" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size  
  admin_username      = var.admin_username
  admin_password      = var.admin_password  #ydi hm SSH ke jgh password use kr rhy hai to yha pr line no.23 add krna pdega
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.nic.id
  ]
   #admin_ssh_key {
    #username   = "adminuser"   jb admin
    #public_key = file("~/.ssh/id_rsa.pub")
 # }
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher
    offer     = var.image_offer
    sku       = var.image_sku
    version   = var.image_version
  }
}


#   resource "azurerm_network_interface" "nic" {
#   name                = "nic_todu"
#   location            = "centralindia"
#   resource_group_name = "rg_toduapp"

#   ip_configuration {
#     name                          = "internal"
#     subnet_id                     = "/subscriptions/099d73e0-39f5-4b5c-bb6d-741b2dcec4af/resourceGroups/rg_toduapp/providers/Microsoft.Network/virtualNetworks/vnet_toduapp/subnets/frontend_subnet"
#     private_ip_address_allocation = "Dynamic"
#   }
# }

# resource "azurerm_linux_virtual_machine" "VM" {
#   name                = "vm_todu"
#   resource_group_name = "rg_toduapp"
#   location            = "centralindia"
#   size                = "Standard_F2"
#   admin_username      = "admintodu"
#   admin_password      = "todu123"
#   disable_password_authentication = false
#   network_interface_ids = [
#     azurerm_network_interface.nic.id
#   ]
#    #admin_ssh_key {
#     #username   = "adminuser"   jb admin
#     #public_key = file("~/.ssh/id_rsa.pub")
#  # }
#   os_disk {
#     caching              = "ReadWrite"
#     storage_account_type = "Standard_LRS"
#   }

#   source_image_reference {
#     publisher = "Canonical"
#     offer     = "0001-com-ubuntu-server-jammy"
#     sku       = "22_04-lts"
#     version   = "latest"
#   }
# }