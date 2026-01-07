variable "sql_server_name" {
    description = "this name of sql server"
    type = string   
}
variable "resource_group_name" {
    description = "this name of resource group"
    type = string   
}   
variable "location" {
    description = "this location of sql server"
    type = string   
}
variable "administrator_login" {
    description = "this admin login of sql server"
    type = string   
}
variable "administrator_login_password" {
    description = "this admin password of sql server"
    type = string   
}
