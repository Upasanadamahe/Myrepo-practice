variable "ami" {
    description = "this is os details for instances"
    default = ""
    type = string
}
variable "instance_type" {
  description = "this is type of server"
  type = string
  default = ""
}
variable "key_name" {
  description = "this is key-pair"
  type = string
  default = ""
}