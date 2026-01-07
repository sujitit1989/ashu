variable "public_ip_name" {
  type        = string
  description = "Name of the Public IP"
}
variable "public_ip_sku" {
  type        = string
  description = "SKU of Public IP"
}
variable "allocation_method" {
  type        = string
  description = "Allocation method for Public IP"

}
variable "public_ip_location" {
  type        = string
  description = "Azure region"
}
variable "resource_group_name" {
  type        = string
  description = "Name of the Resource Group"
}