FROM condaforge/mambaforge

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurmd slurm-client -y
#RUN apt install sudo -y && 
#RUN apt install python3.9 python3-pip -y
# && useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/
EXPOSE 6817 6818 6819  
# ENV USER root

RUN apt update -y && apt install libopenmpi-dev -y && pip3 install mpi4py torch torchvision pytorch_lightning test-tube

#test-tube torch pytorch_lightning torchvision 

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
