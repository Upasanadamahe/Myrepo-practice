module "first" {
    source = "../day8-modules"
   ami_id = "ami-0bb84b8ffd87024d8"
   instance_type = "t2.micro"
   key_name = "mykey"

}