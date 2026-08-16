variable "vm" {
  type = map(any)
}

variable "nic" {
  type = map(any)
}

variable "ssh_public_key" {
  type      = string
  sensitive = false
}