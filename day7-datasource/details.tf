# Datasource is used to call already created resources.
# in datasource like instead of giving the value directly , we are creating data block and use some filters to pick the resource from remote(aws)
# syntax:: 
# below first creating data-block and to select particular subnet applying the filter and passing value of name 
# so data source will go to aws-remoteinfrastructure and pick that subnet , the subnet which has same name /name value matched 
# and it will return that value inside the resource -block ,with the argument subnet_id = data.aws_subnet.selected.id
# data "aws_subnet" "selected" { 
     
#     name   = "tag:Name" 
#     values = ["Subnet_1"] 
#   } 
# } 
# filter {  ##### yaha par hmlog filter laga rhe hai filter name aur value k liye apply hua hai 

 # ####### ab name aur values k andar kis tarah ki category hai vo 
# ////name="tag:Name " yahha par diya hua hai ki name kki jagah hoga tags jisme Name ayega yahi exact name hoga 
# /// yaniki  name k andar ham cateory de rahe hai tags attribute k liye aur tags hote hai name remote resource ka
# // aur values k andar hamlog vahi resource name likhenege kyuki value tags k liye hai jo ek tarah ka name hai resource ka  
#/ to filter ka mtlb hua ki andar hamne pehle select kiya name jisme hoga tags , aur tags k andar hoga values jisme hoga exact value jo remote resource ki asal detail hai 

# resource"" ""{

# #  details of resource to create that resource 
# subnet_id = data.aws_subnet.selected.id 
# }

# datasource are useful becoz we don't need to go remote infratructure details again we call these values repeatdly 
# with data-blocks