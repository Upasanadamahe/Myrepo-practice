variable "ami" {
  description = "here are os details"
  default = "ami-0bb84b8ffd87024d8"
  type = string
}
variable "instance_type" {
  description = "this is type of instance"
  default = "t2.micro"
  type = string
}
variable "key_name" {
 description = "this is  key pair"
 default = "mykey"
 type = string
}
