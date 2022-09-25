
#FROM condaforge/mambaforge
FROM ubuntu:20.04
RUN apt update -y && apt install munge -y && apt install vim -y && apt install build-essential -y && apt install git -y && apt-get install mariadb-server -y && apt install wget -y

ARG DEBIAN_FRONTEND=noninteractive
RUN apt install slurm-client curl dirmngr apt-transport-https lsb-release ca-certificates python3.9 python3-pip -y
#RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
#RUN apt install 
#RUN apt update -y && apt install nodejs -y && npm install -g configurable-http-proxy 

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY docker-entrypoint.sh /etc/slurm-llnl/

WORKDIR /home/root

EXPOSE 8888

#RUN apt install libopenmpi-dev -y && pip3 install mpi4py &&
#RUN conda create -y --name open-ce python=3.9 --channel https://ftp.osuosl.org/pub/open-ce/current/ --channel defaults 
#RUN conda init bash 
#RUN conda run -n open-ce pip install jupyterlab jupyterlab_slurm torch
RUN pip3 install jupyterlab jupyterlab_slurm torch
RUN pip3 install jupyterlab-drawio jupyterlab-execute-time jupyterlab-system-monitor jupyterlab-git

ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]
