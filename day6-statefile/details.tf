the most important thing is to remember that we are doing work with terraform here ,so our work is from terraform (vs-code inside laptop/system) to remote (aws console/ github)
statefile maintain the state of desired state (loacl files )to current state(remote-console)

statefile work is to track the desired file/desired configuration file to remote configuration and get back to terraform(inside vs-code/folders), 
and notify that something is to add , to change ,to delete,to modify like in my local configuration codes i modify changes and in remote that thing 
is not modify so , statefile will say to terraform in remote something to change, to add , to destroy becoz local code and remote details are not matched here 
so statefile desired configuration = the local configuration inside vs-code files/folders and remote configuration = aws console (manual/GUI)
statefile actions only captured after run terraform apply , terraform destroy and works like above mentioned process ,

if i delete statefile in my local configuration in vs-code folders so whatevr actions till now done here will be deleted , so who can say this details to system 
so i can say the statefile giving information to the system that it is available in remote configuration or not ,otherwise 
system will not understand this action previously done , it will take every action as new / fresh action only .

so statefile is a bridge between remote details and local files 

don't maintain statefile in local system(laptop-folder), if something happend in laptop so entire action/history will be gone 

for example . at the starting i create code and run with terraform apply then want to create new changes with that codes which is developed already as infrastructure
 at this step i delete the statefile and create new changes in local configuration file so terraform only knows the new steps 
 it will not consider the older infrastructure which is created previously . so from terraform apply 
 terraform will start work as create the new things along with the existing code ,and the code infras. which already there terraform will not track them 
 becoz associated statefile deleted in local configuration 
 
 for example like 2 persons wants to work with the same repo./project , so for that repo./project statefile also same not diff. 
 becoz maintaining statefile in local is not recommended and here in terraform we are dealing infrastructure only not the codes (application)
 so any action inside terraform it will be captured by the statefile and for next action the statfile is acts as reference for terraform .

 question ..can i keep statefiles in github repo..?
 ans. it has large configuration details so unable to store them into github , sensitive details also there 
 like developer 1 clone the code with statefile and developer 2 also clone same repo. with statefile now both end code is there but diff. statefile 
 for the same repo./ project so diff. actions are there which is not good at all to complete a single project/file  2 statefiles are there 
  
  so we should not maintain the statefile into local system if multiple developers are working with same repo, conflicts may raise, so here we 
  can see diff. statefile information will be recorded into both ends
   not a good practice to maintain statefile in local /github if we delete accidently statefile in local system it is difficult to get backup

   question .. where we store/ keep our statefile for project/ repository ??
   ans.. In aws S3-bucket i can keep the statefile and backup is also possible with s3 bucket becoz versioning system is there 
    even if accidently delete s3 -bucket in one region so replicas are available in diff. region , like if i upload new codes in s3-bucket 
    it will update the changes  in replicas also which is in diff. region but when deletion time it is not possible in that replicas in diff. region 
    for delete them i have to go one by one region-wise s3-bucket .

    Note : no one has the access of this s3-bucket .



    
  
