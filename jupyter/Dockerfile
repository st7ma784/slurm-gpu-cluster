
#FROM condaforge/mambaforge
FROM ubuntu:20.04
RUN apt update -y && apt install munge -y 
RUN apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client slurmd -y
RUN apt install curl dirmngr apt-transport-https lsb-release ca-certificates -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install python3 python3-pip sudo -y
RUN apt update -y && apt install nodejs -y && npm install -g configurable-http-proxy 

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
ENV SHELL bash

WORKDIR /home/root

EXPOSE 8888

RUN apt install libopenmpi-dev -y 
RUN pip3 install jupyterlab jupyterlab_slurm mpi4py torch pytorch-lightning jupyterlab-drawio jupyterlab-execute-time jupyterlab-system-monitor jupyterlab-git
#RUN conda create -y --name open-ce python=3.9 --channel https://ftp.osuosl.org/pub/open-ce/current/ --channel defaults 
#RUN conda init bash 
#RUN conda run -n open-ce pip install jupyterlab jupyterlab_slurm torch
COPY docker-entrypoint.sh /etc/slurm-llnl/

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]