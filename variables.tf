variable "prefix" {
  description = "The prefix which should be used for all resources in this example"
}

variable "location" {
  description = "The Azure Region in which all resources in this example should be created."
}

variable "certificate" {
  description = "The certificate to use for authenticate over ssh to the VM"
  default =  "~/.ssh/id_rsa.pub"
}
