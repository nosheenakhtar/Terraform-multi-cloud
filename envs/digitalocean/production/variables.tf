variable "project" { type = string }
variable "env"     { type = string }
variable "owner"   { type = string default = "devops" }
variable "region"  { type = string default = "nyc3" }
variable "vpc_cidr" { type = string default = "10.70.0.0/16" }
variable "size" { type = string default = "s-1vcpu-1gb" }
variable "image" { type = string default = "ubuntu-22-04-x64" }
variable "ssh_key_fingerprint" { type = string }
