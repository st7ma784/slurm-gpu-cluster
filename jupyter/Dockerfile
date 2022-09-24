FROM condaforge/mambaforge as condaenv

RUN apt update -y && apt install sudo -y && useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

ARG DEBIAN_FRONTEND=noninteractive 
RUN apt update -y && apt install libopenmpi-dev munge vim build-essential git mariadb-server slurm-client dirmngr apt-transport-https lsb-release ca-certificates -y 
run chmod +777 /root

ENV USER admin
USER admin

RUN conda create -p /root/open-ce python=3.9 pip --channel https://ftp.osuosl.org/pub/open-ce/current/ --channel defaults
RUN conda run -p /root/open-ce pip install torch torchvision ipykernel jupyterlab jupyterlab-git jupyterlab-drawio jupyterlab-execute-time jupyterlab_slurm jupyterlab-system-monitor && conda clean -afy

EXPOSE 8888
COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
ENV SHELL bash
COPY docker-entrypoint.sh /etc/slurm-llnl/

WORKDIR /home/admin
ENTRYPOINT ["/etc/slurm-llnl/docker-entrypoint.sh"]


