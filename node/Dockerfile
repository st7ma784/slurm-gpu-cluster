FROM ubuntu:20.04

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install munge -y
RUN apt install slurmd slurm-client python3.9 python3-pip -y 
RUN apt install sudo -y
#&& useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/
EXPOSE 6817 6818 6819  
# ENV USER root

RUN pip3 install torch pytorch-lightning torchvision
WORKDIR /home/root
ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
