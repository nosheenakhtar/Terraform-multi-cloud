variable "project" { type = string }
variable "region"  { type = string }
variable "cidr_block" { type = string  default = "10.50.0.0/16" }
variable "public_subnet_cidr" { type = string default = "10.50.1.0/24" }
variable "instance_type" { type = string default = "t3.micro" }
variable "public_key_path" { type = string }
variable "tags" { type = map(string) default = {} }
