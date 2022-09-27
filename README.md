# slurm-cluster
Docker local slurm cluster

https://medium.com/analytics-vidhya/slurm-cluster-with-docker-9f242deee601

To run slurm cluster environment you must execute:

     $ docker-compose -f docker-compose-jupyter.yml up -d

To stop it, you must:

     $ docker-compose -f docker-compose-jupyter.yml stop

To check logs:

     $ docker-compose -f docker-compose-jupyter.yml logs -f

     (stop logs with CTRL-c")

To check running containers:

     $ docker-compose -f docker-compose-jupyter.yml ps


When jupyterlab is up, transfer the other files in. (or mount this folder... but that seems like effort)

NODECHECK.slurm simply raises multiple tasks and prints some debugs to check which nodes are present. Edit this if you want to check for certain libraries and or capabilities. 

DEMOTRAIN.slurm is present to call a simple pytorch lightning script. Edit this with your research code! for repeat use, I would suggest writing a PL.DataModule for all the data and importing it. 


##To Do

Currently, pip3 is the package manager in each container. It'd be awesome to use something more beefy like Conda to reduce install times, and even share envs between containers. 

GPU support is also a priority, Theoretically, the version of torch installed with Pip will natively support a GPU mounted via docker-compose... but this may not be a given, especially if tools like nvidia-smi are desired. 

Docker compose comes with a --scale flag. It'd be lovely to use this instead of the current manual numbering scheme. something about the slurm config doesnt like the change from slurmnode[1-10] to slurmnode_[1-10]

