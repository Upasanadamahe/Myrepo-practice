module "newpath"{
    source ="github.com/Upasanadamahe/Myrepo-practice/day2"
    ami ="ami-0bb84b8ffd87024d8"
    instance_type="t2.micro"
    key_name ="mykey"
}