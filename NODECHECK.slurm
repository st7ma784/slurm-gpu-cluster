#!/bin/bash
#
#SBATCH --job-name=test
#SBATCH --output=NODESCHECK.out
#SBATCH --ntasks-per-node=5
#SBATCH --ntasks=20
#SBATCH --nodes=4
source /miniconda/etc/profile.d/conda.sh
conda activate /env/open-ce
sbcast -f test.py /tmp/test.py
srun python3 /tmp/test.py
