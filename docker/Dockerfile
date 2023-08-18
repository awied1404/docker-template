# Select your base image here
FROM ubuntu:20.04

LABEL maintainer="andreas.wiedholz@xitaso.com"
LABEL version="0.1"
LABEL description="description"

ARG DEBIAN_FRONTEND=noninteractive
ENV TZ=Europe/Berlin

# get apt cache
RUN apt update

# install base packages
RUN apt install -y curl tar sudo python3 python3-pip vim
RUN apt-get install -y tzdata 

# necessary as then during installations no interactive timezone setting is required
RUN dpkg-reconfigure tzdata

# Add a user
ENV USER=andi

RUN useradd -rm -d /home/${USER} -s /bin/bash -g root -G sudo -u 1000 ${USER} -p "$(openssl passwd -1 ${USER})"
WORKDIR /home/${USER}

# switch into user mode
USER ${USER}

# Execute the commands you want to do as a user, e.g. installation of python packages
# RUN pip3 install ...

WORKDIR /home/${USER}
