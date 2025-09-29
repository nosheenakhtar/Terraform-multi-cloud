variable "project" { type = string }
variable "location" { type = string default = "eastus" }
variable "address_space" { type = list(string) default = ["10.60.0.0/16"] }
variable "subnet_prefix" { type = string default = "10.60.1.0/24" }
variable "admin_username" { type = string default = "devops" }
variable "public_key_path" { type = string }
variable "tags" { type = map(string) default = {} }
