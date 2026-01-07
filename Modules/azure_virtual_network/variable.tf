    variable "virtual_network_name" {
    description = "yeh vn ka name hai"
    type    = string
    }
    variable "virtual_network_location"{
    description = "yah vn ka location hai"
    type    = string
    }
    variable "resource_group_name" {
    description = "yah gr ka name hai"
    type    = string
    }
    variable "address_space" {
    description = "address space of the virtual network"
    type    = list(string)
    }