variable "ami" {
  type    = string
  default = "ami-0bb84b8ffd87024d8"  
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "computerscience" {
type    = list(string)
 
  # first with list default = ["datamining","os","cgm","yahoo","linkedlist","rdbms"]
  # after modify list default = ["datamining","os","linkedlist","rdbms"]

  default = ["datamining","os","linkedlist","rdbms"]
}
variable "key_name" {
  type = string
default = "mykey"
}