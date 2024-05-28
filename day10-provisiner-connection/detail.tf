# connection comes under one of the meta data in terraform , by using connectio i can connect my terraform (local )to  running ec2 instance (remote)
# Why terraform need to connect ec2 if terraform wants to print something in the runing server (ec2)so connection is the option with terraform 
# in general when am trying to talk from local to my running ec2 4 things i needed to communicate 
#  a) ip-public 
#  b) internet 
#  c)protocal
#  d)username/user and keys (private-key)

#  in the connection block i can communicate from terraform to my same ec2-instance 
#  synatx:
#  connection{
#     type =ssh
#     user= ubuntu
#     private_key = file("~/.ssh/id_rsa")
#     host= self.public.ip
#  }
#  under type=ssh  which type of protocol to communicate , which is ssh here 
#  user is the username which is going to communicate with instance so here ubuntu server so ubuntu user 
#    if it is linux server so username is ec2-user just replace with the appropriate username for ec2instance
# private_key this is path of private-key of your ec2-instance in linux i can generate keys with ssh-gen command
# host is used with self so inside same directory resource is created for ec2 which is running in remote and connection is define 
# so when am using connection to communicate ec2-remote location "self " will call that paricular public -ip only 
# so for using self , connection and resource block for ec2 are available in the same directory otherwise self will not work 
# usually for public ip i can use output-block and use that output block refernce to take the public ip like 
# host =output.public_ip instead of using  host= self.public.ip 



