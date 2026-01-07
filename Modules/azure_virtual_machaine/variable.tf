variable "nic_name" {
  description = "Name of the network interface"
  type        = string
}

variable "location" {
  description = "Location of the resources"
  type        = string
}

variable "resource_group_name" {
  description = "Name of the resource group"
  type        = string
}

variable "subnet_id" {
  description = "ID of the subnet"
  type        = string
}

variable "vm_name" {
  description = "Name of the virtual machine"
  type        = string
}

variable "vm_size" {
  description = "Size of the virtual machine"
  type        = string
}

variable "admin_username" {
  description = "Admin username for the virtual machine"
  type        = string
}

variable "admin_password" {
  description = "Admin password for the virtual machine"
  type        = string
}

variable "image_publisher" {
  description = "Publisher of the image to use for the virtual machine"
  type        = string
}

variable "image_offer" {
  description = "Offer of the image to use for the virtual machine"
  type        = string
}

variable "image_sku" {
  description = "SKU of the image to use for the virtual machine"
  type        = string
}
variable "image_version" {
  description = "Version of the image to use for the virtual machine"
  type        = string
}
variable "pip_id" {
  description = "ID of the public IP address"
  type        = string
}