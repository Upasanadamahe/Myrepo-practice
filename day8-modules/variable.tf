variable "ami_id" {
  default = ""
  type = string
  description = "this is os id"
}
variable "instance_type"{
  default = ""
  type = string
  description = "this is type of instance"
}

variable "key_name" {
    default = ""
    type =string 
    description ="this is keypairs"
}
