#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=SRUNTEST1
#
#SBATCH --nodes=4
export NCCL_DEBUG=INFO
export PYTHONFAULTHANDLER=1

# on your cluster you might need these:
# set the network interface


##### Number of total processes 
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "
echo "Nodelist:= " $SLURM_JOB_NODELIST
echo "Number of nodes:= " $SLURM_JOB_NUM_NODES
echo "Ntasks per node:= "  $SLURM_NTASKS_PER_NODE
echo "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX "




# # ******************* These are read internally it seems ***********************************
# # ******** Master port, address and world size MUST be passed as variables for DDP to work 
# export MASTER_PORT=$(expr 10000 + $(echo -n $SLURM_JOBID | tail -c 4))
# export WORLD_SIZE=$(($SLURM_JOB_NUM_NODES * $SLURM_NTASKS_PER_NODE))
# echo "MASTER_PORT"=$MASTER_PORT
# echo "WORLD_SIZE="$WORLD_SIZE

# master_addr=$(scontrol show hostnames "$SLURM_JOB_NODELIST" | head -n 1)
# export MASTER_ADDR=$master_addr
# echo "MASTER_ADDR="$MASTER_ADDR
# # ******************************************************************************************

# zoom zoom - recommended from lightning
export NCCL_NSOCKS_PERTHREAD=4
export NCCL_SOCKET_NTHREADS=2
export NCCL_MIN_CHANNELS=32


echo "Run started at:- "
date

sbcast -f PLDemo.py PLDemo.py
sbcast -f PLDemo.py /tmp/train.py
sbcast -f HOparser.py /tmp/HOparser.py
sbcast -f PLDemo.py /tmp/PLDemo.py
srun pip3 install test-tube pytorch-lightning #hopefully to be replaced by conda? 
srun python3 /tmp/train.py 

