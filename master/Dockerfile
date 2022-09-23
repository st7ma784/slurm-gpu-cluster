FROM ubuntu:20.04 as base

ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install munge vim build-essential git mariadb-server wget slurmd slurm-client python3.9 python3-pip libopenmpi-dev -y
RUN apt install sudo -y && useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN pip3 install mpi4py
COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/
FROM base

EXPOSE 6817 6818 6819 3306 

WORKDIR /home/admin

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
