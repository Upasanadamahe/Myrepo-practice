# in terraform module are used to call the configuration files from one directory to another directory 
# with module we can use already created files of infrastruture with new values 
# so don't include the terraform.tfvars files of the already created directory/file only use source -code of infrsatructure 
# with module no such concept of terraform-local-name just create module start with module "name"{}
# syntax:
# module "name" {
#     source = "../path of the directory that contains source -code "
#     #  now to include the valuees of variable define value with variable name after source =""
#     # which value u want to run with source-code 
#     #only those variable will takes place in remote infrasturcture which were inside mainfile(main.tf) and variablefile(variable.tf)
# # if u define/assign value to a new variable which is unknow to thw source-block or configuration files, so error is shown by terraform 
# #  whatever resources inside the configured file , i can use any of them it is not mandate to define /use all value in the created-module
# Don't include that files in source which has values becoz iam going to define new values here 
#  if i include files which has hardcoded values , so these values will execute/run instead of the value which am expecting there  
# }

# benefits of using modules
#  1. no need to write code for existing infrastruture , i can call them under module , source =""
# 2. test code with diff. values 
# 3. use diff. directory/different files to add more services/ resource for infrstructure
# 4. time saving process with module - file execution 
# 5. it will short / compress the code which i am going to run 
# 6. simplyfy the mode of file -configuration , so that easily rectify error /mismatched content 
