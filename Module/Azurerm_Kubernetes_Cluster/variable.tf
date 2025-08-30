variable "aks-name" {}
variable "rg-name" {}
variable "location" {}
variable "dns_prefix" {}
variable "node_count" {
  default = 1
}

variable "vm_size" {
  default = "Standard_D2_v2"
}

variable "tags" {}