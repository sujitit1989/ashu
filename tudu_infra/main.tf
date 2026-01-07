module "resource_group" {
  source = "../modules/azure_resource_group"
  resource_group_name = "rg_toduapp"
  resource_group_location = "centralindia"
}
module "virtual_network" {
    depends_on = [ module.resource_group ]
    source = "../modules/azure_virtual_network"
    resource_group_name = "rg_toduapp"
    virtual_network_location = "centralindia"
    virtual_network_name = "vnet_toduapp"
    address_space = ["10.0.0.0/16"]  # ye ak CIDR range hota hai
}
module "frontend_subnet" {
  depends_on = [ module.virtual_network ]
  source = "../modules/azure_subnet"

  resource_group_name  = "rg_toduapp"
  virtual_network_name = "vnet_toduapp"
  subnet_name          = "frontend_subnet"
  address_prefixes     = ["10.0.1.0/24"]
}

module "backend_subnet" {
  depends_on = [ module.virtual_network ]
  source = "../modules/azure_subnet" 
  resource_group_name    = "rg_toduapp"
  virtual_network_name   = "vnet_toduapp"
  subnet_name            = "backend_subnet"
  address_prefixes       = ["10.0.2.0/24"]
}

module "public_ip_frontend"{
    source = "../modules/azure_public_ip"
    resource_group_name = "rg_toduapp"
    public_ip_name = "pip_frontend"
    public_ip_location = "centralindia"
    public_ip_sku = "Standard"
    allocation_method = "static"
}
module "frontend_vm"{
    depends_on = [ module.frontend_subnet ]
    source = "../modules/azure_virtual_machaine"
    resource_group_name = "rg_toduapp"
    location = "centralindia"
    image_publisher = "Canonical"
    image_offer = "0001-com-ubuntu-server-jammy"
    image_sku = "22_04-lts"
    image_version = "latest"
    vm_size = "Standard_D2s_v3"
    vm_name = "frontendvm"
    nic_name = "frontend_nic"
    admin_username = "frontendadmin"
    admin_password = "admin@1234"
    subnet_id = "/subscriptions/099d73e0-39f5-4b5c-bb6d-741b2dcec4af/resourceGroups/rg_toduapp/providers/Microsoft.Network/virtualNetworks/vnet_toduapp/subnets/frontend_subnet"
    pip_id = "/subscriptions/099d73e0-39f5-4b5c-bb6d-741b2dcec4af/resourceGroups/rg_toduapp/providers/Microsoft.Network/publicIPAddresses/pip_frontend"
}
module "public_ip_backend"{
    source = "../modules/azure_public_ip"
    resource_group_name = "rg_toduapp"
    public_ip_name = "pip_backend"
    public_ip_location = "centralindia"
    public_ip_sku = "Standard"
    allocation_method = "static"
}
module "backend_vm"{
    depends_on = [ module.backend_subnet ]
    source = "../modules/azure_virtual_machaine"
    resource_group_name = "rg_toduapp"
    location = "centralindia"
    image_publisher = "Canonical" #given by client ya developer(in todo code me backend vm ke liye diya tha)
    image_offer = "0001-com-ubuntu-server-focal"  #given by client ya developer(in todo code me backend vm ke liye diya tha)
    image_sku = "20_04-lts" #given by client ya developer(in todo code me backend vm ke liye diya tha)
    image_version = "latest" #given by client ya developer #abhi to todu application se le rhe hai jo backent ka diya hai(in todo code me backend vm ke liye diya tha)
    vm_size = "Standard_D2s_v3"
    vm_name = "backendvm"
    nic_name = "backend_nic"
    admin_username = "backendtoduadmin" 
    admin_password = "todu#1234"
    subnet_id = "/subscriptions/099d73e0-39f5-4b5c-bb6d-741b2dcec4af/resourceGroups/rg_toduapp/providers/Microsoft.Network/virtualNetworks/vnet_toduapp/subnets/backend_subnet"
    pip_id = "/subscriptions/099d73e0-39f5-4b5c-bb6d-741b2dcec4af/resourceGroups/rg_toduapp/providers/Microsoft.Network/publicIPAddresses/pip_backend"
}
module "sql_server" {
    source = "../modules/azure_sql_server"
    resource_group_name = "rg_toduapp"
    location = "centralindia"
    sql_server_name = "todusqlserver07"
    administrator_login = "sqladmin"
    administrator_login_password = "Sql@1234"
   }

module "sql_database_name" {
    depends_on = [ module.sql_server ]
    source = "../modules/azure_sql_database"
    sql_database_name = "todusqldatabase07"
    sql_server_id = "/subscriptions/099d73e0-39f5-4b5c-bb6d-741b2dcec4af/resourceGroups/rg_toduapp/providers/Microsoft.Sql/servers/todusqlserver07"
}