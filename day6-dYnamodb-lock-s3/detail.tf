
# Dynamo-db locking is provide locking to the file during execution ,like if developer working with the same project so it will not allow 
#            multiple requests the same time who ever working the same project.

# --so how this Dynamo-DB works with s_3 bucket explain :
#  a)whenever you run a resource the statefile will generate
#  b) as statefile already configured in s_3 bucket 
#  c) now we already created dbtable, so dynamo-db table which is associated with the file which is a statefile and in db-table query runs as statefile is doing the work
#  d) as statefile runs the actions locking machenism provided by the dbtable so no other action is allowed till the action is completed
#  e) so due to state-locking mechanism statefile will not take any other command till it completes the running one becoz one locking process is start
#  f) now after the task completed by the statefile at a time ,it will check for the next time execution only if terraformapply /terraform destroy 
#  g) now what about the db in the db table query runs along with that query locking is activate with an associated file.

#  >> follow the steps below:

# 1. In the backend to captured the history of statefile(large configuration) i created one s3 bucket along with enable versioning option , so in s3 bucket files versioning
#    is applicable for entire buckets objects(folders )
# 2. but with statefile one more difficulty occurs like only one statefile applicable for a prject no one has a separate one everyone works simultaneously 
#    so to provide this locking machanism of statefile for a particular user action , we are using dynamo-DB 
# 3. the main reason is that whenever 2 developer work with the same file , corresponding statefile is active there if developers give terraform apply at the same time 
#    or at diff. time like changes already in progress from developer-1 and developer -2 apply at the same time , and changes from dev-1 is not completed 
#    so conflicts happened , to prevent this actions "at the same instruction/working with same project at same time " so this dynamo-DB locking process will not allow 
#    multiple request at the same ,who ever working with the same file, it will provide locking for all operation and make sure no buddy else runs terraform cmnds at the same time.

# 4. Dynamo-db table is a nonsql db , it will store values in the form of key-pair and db works with query language like to operate db information 
#    you need to  write a query 
# 5. first create a resource for dynamo-db in terraform 
# 6. add this dynamo-db resource into the same file ,where we keep the backend configuration of s3 bucket becoz in s_3 we are keeping statefile.
# 7. this is one time job ,so s_3 bucket is also one time job for statefile and dynamo-bd locking -table files is also inside the same bucket
# 8. remember this point for storing statefile actions as backup create one file in s_3 bucket
# 9. in the same file statefile-locking is applicable with dynamo-bd table 

# 10. If i want to apply dynamo-db locking for new resources which is in same or different directory ,so how to that ?
#     -- as i know DB-table and s_3 bucket is one time job ,now to store details in s_3 and to provide state-locking for other resources 
#    --copy paste the previous code for backend block creation in that change the name of db table so create db-table with that name 
#    --give diff. folder-name for storing statefile in s_3 bucket 