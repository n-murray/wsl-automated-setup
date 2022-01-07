#The base image
FROM ubuntu:20.04

ARG USER  

#Install required applications
RUN apt-get update -y && apt-get -y install python iputils-ping \
    iproute2 curl wget vim passwd sudo apt-transport-https ca-certificates \
    software-properties-common openjdk-8-jdk

#Add maven from web source
RUN wget 'https://dlcdn.apache.org/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz' -P /opt/ ;\
    tar -zxvf /opt/apache-maven-3.5.4-bin.tar.gz -C /opt ;\
    rm -rf /opt/apache-maven-3.5.4-bin.tar.gz

#Add current user to environment 
RUN /bin/bash -c 'useradd -m -s /bin/bash -g root ${USER}; echo "${USER}:PassW0rd" | chpasswd'

#Add wsl settings to change mount point and default user
COPY ./resources/wsl.conf /etc/wsl.conf
RUN /bin/bash -c 'echo "default=${USER}" >> /etc/wsl.conf; \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers;'

#Set the default user
USER $USER

#Add default .bashrc for new user
COPY --chown=$USER:root ./resources/bashrc /home/${USER}/.bashrc 


