variable "resource_group" {
  type    = list(string)
  default = ["rg1", "rg2", "rg3"]
}

variable "location" {
  type    = string
  default = "South India"
}

variable "storage_account" {
  type = list(string)
  default = ["st250305012323","st25051","st25052"]
  
}