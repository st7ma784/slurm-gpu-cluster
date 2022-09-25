#!/bin/bash

sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf

service munge start
slurmd -N $(hostname)

tail -f /dev/null
