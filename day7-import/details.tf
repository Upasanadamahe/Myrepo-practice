
# importing manual created infrastructure to terraform control

# terraform import option is available to take the control from aws-remote resources to terraform control 
# whenever you are importing a resource means statefile is generated , so terraform registry will give the control (statefile) of 
# existing /active / manually created resource in aws console/remote to terraform , here terraform means in local files

# just opposite action like with terraform work flow is from local configured file to remotely generated infrastructure after using terraform apply
# but with terraform import command am taking the (live) control from remote /actual generated resources into my terraform (local machine/vs-code terraform files )

# the statefile will only track changes from remote to local like it has to maintain the desired state(local) to current state (resource).

# one important point importing of resource, does not update the resources in local files only statefile(detailed roadmap of instance) is available in terraform control
# so to use that statefile i need to complete the mapping , like check statefile resource details and code that resource in local files after applying import cmnd only
# without giving terraform apply ,untill it will show no changes are there means everything is same 

# just check statefile and map the resource as it is mentioned in the statefile-actions without single change 
# give terraform plan cmnd to check the changes from remote to local what is the difference between already running resource and local file of the resource in terraform 

# syntax ::
# terraform import aws_instance.myvm <instance-id>
# replace -- myvm = localnameinsideterraform 
#            instance-id =instacne id running instance 

# step1))  in terraform folder (laptop)create one separate directory inside create file for resource -block
# step2)) terraform init to initialize directory with terraform plugins
# step3 ))give the above command for importing resources 
# step4 )) check with statefile and create same resource details there 
# step5)) check status of file with terraform plan only don't use apply /destroy command untill it comes to no changes there 
# step6)) so after checking that no changes control of running instance is in your hand with terraform 