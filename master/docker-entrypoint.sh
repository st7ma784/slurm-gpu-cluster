#!/bin/bash

sed -i "s/REPLACE_IT/CPUs=$(nproc)/g" /etc/slurm-llnl/slurm.conf
sudo service munge start
service slurmctld start

tail -f /dev/null
