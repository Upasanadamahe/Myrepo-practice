# dependency blocks are used for dependent actions , like  one service creation is dependent on another service 
# the terms used here is dependens on like  abc-service is dependent on ghy-service 
# so in the resource block of ghy-service i use depends on (the service which is depenedent = abc -service  )
# so after that i define the new resource of abc-service , now terraform apply first that service is created which is in abc-service
# after that another service created which ghy-service 

# syntax ::
# resource "aws_service" "abc-service"{
# ami=""
# tags={}
# instance_type =""
# key_name=""
# depends_on = [aws_service.ghy-service ]
# } 

# resource "aws_service" "ghy-service"{
#     ami="" 
#     key_name=""
#     instance_type =""
#     tags={}

# }