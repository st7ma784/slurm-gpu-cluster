
sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf
source /miniconda/etc/profile.d/conda.sh

service munge start

slurmd -N $(hostname)

tail -f /dev/null