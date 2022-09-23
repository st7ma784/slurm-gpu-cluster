FROM condaforge/mambaforge as condaenv
COPY predict-linux-64.lock .
RUN mamba create --copy -p /env --file predict-linux-64.lock && conda clean -afy

FROM condaenv
ARG DEBIAN_FRONTEND=noninteractive
RUN apt update -y && apt install libopenmpi-dev munge vim build-essential git mariadb-server wget slurm-client curl dirmngr apt-transport-https lsb-release ca-certificates -y
RUN curl -sL https://deb.nodesource.com/setup_12.x | bash -
RUN apt install sudo -y && useradd -m admin -s /usr/bin/bash -d /home/admin && echo "admin:admin" | chpasswd && adduser admin sudo && echo "admin     ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers
RUN apt update -y && apt install nodejs -y && npm install -g configurable-http-proxy

COPY slurm.conf /etc/slurm-llnl/
COPY cgroup.conf /etc/slurm-llnl/
COPY Docker-entrypoint.sh /etc/slurm-llnl/

WORKDIR /home/admin
EXPOSE 8888
ENV USER admin
ENV SHELL bash


ENTRYPOINT ["/etc/slurm-llnl/Docker-entrypoint.sh"]
