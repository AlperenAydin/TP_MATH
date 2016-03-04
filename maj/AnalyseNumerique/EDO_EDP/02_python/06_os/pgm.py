import os

#read environment variable
home_directory=os.environ['HOME']
print("You home directory is",home_directory)

#list files (equivalent of os.system("ls "+home_directory))
directory_in_home=os.listdir(home_directory)
print("You have",len(directory_in_home), "files or directory in your home path")

#Use the bash operation
os.system("mkdir -p new_directory")
print("new_directory/ is created")

#read the output of the OS call
process_txt=os.popen("ps").read()
process=process_txt.split("\n")
nbr_process=len(process)-2
print("There is currently",nbr_process,"processes in this window")
for k in range(nbr_process):
    print("The process",k," is \"",process[k+1],"\"")



