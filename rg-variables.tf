variable "environment" {
    type = string
    default = "dev" 
}

variable "resource_group_name" {
    type = string
    default = "terraform-rg" 
}

variable "resource_group_location" {
    type = string
    default = "eastus" 
}

variable "business_name" {
  type = string
  default = "ECP"
}