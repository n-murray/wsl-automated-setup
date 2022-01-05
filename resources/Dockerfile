#The base image
FROM ubuntu:20.04

ARG USER  

#Install required applications
RUN apt-get update -y && apt-get -y install python iputils-ping \
    iproute2 curl wget vim passwd sudo apt-transport-https ca-certificates \
    software-properties-common openjdk-8-jdk && \
    #Installing Docker client
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add - \
    && apt-key fingerprint 0EBFCD88 && add-apt-repository \
    "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) \
    stable" && apt-get update -y && apt-get install -y docker-ce

#Add wsl settings to change mount point and default user
COPY ./resources/wsl.conf /etc/wsl.conf
RUN /bin/bash -c 'echo "default=${USER}" >> /etc/wsl.conf; \
    echo "${USER} ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers;'

#Add current user to environment 
RUN /bin/bash -c 'useradd -m -s /bin/bash -g root ${USER}; echo "${USER}:PassW0rd" | chpasswd'

#Set the default user
USER $USER

#Add maven for new user 
RUN sudo wget 'https://dlcdn.apache.org/maven/maven-3/3.5.4/binaries/apache-maven-3.5.4-bin.tar.gz' -P /opt/ ;\
    sudo tar -zxvf /opt/apache-maven-3.5.4-bin.tar.gz -C /opt ;\
    sudo rm -rf /opt/apache-maven-3.5.4-bin.tar.gz

#Add default .bashrc for new user
COPY --chown=$USER:root ./resources/bashrc /home/${USER}/.bashrc 


