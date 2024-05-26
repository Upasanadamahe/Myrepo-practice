variable "ami" {
  default = "ami-0bb84b8ffd87024d8"
  type = string
  description = "this is my os"
}

variable "instance_type"{
    default = "t2.micro"
    type = string
    description = "this is type of instance"
}

variable "key_name" {
  default = "mykey"
  type = string
  description = "this is key-pair for instance"
}

variable "key_name01" {
  default = "pvt"
  type = string
  description = "this is key-pair for instance"
}