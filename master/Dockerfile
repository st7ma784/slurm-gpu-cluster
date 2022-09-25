FROM ubuntu:20.04 as base

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurmd slurm-client slurmctld -y
#RUN apt install python3.9 python3-pip -y 
# #&& useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers 


COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/
FROM base

EXPOSE 6817 6818 6819 3306 

WORKDIR /home/root

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
