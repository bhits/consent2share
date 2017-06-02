#!/bin/bash -x
dockerVersion=17.03.1.ce-1.el7.centos
dockerComposeVersion=1.13.0

sudo su << SudoUser
    #Install 1.13.0-1.el7.centos docker version
    #https://docs.docker.com/engine/installation/linux/centos/

    function unInstallDocker(){
        yum -y remove docker \
                  docker-common \
                  container-selinux \
                  docker-selinux \
                  docker-engine

        rm -rf /var/lib/docker

        rm /usr/local/bin/docker-compose

        rm -rf /etc/docker
    }
    function installDocker() {
        # Remove old package name docker if exists
        yum -y remove docker
        yum -y remove docker \
                      docker-common \
                      container-selinux \
                      docker-selinux \
                      docker-engine
        rm -rf /var/lib/docker

        # Set up the repository
        #Install yum-utils, which provides the yum-config-manager utility
        # device-mapper-persistent-data and lvm2 are required by the devicemapper storage driver
        yum install -y yum-utils device-mapper-persistent-data lvm2

        #set up the stable repository
        yum-config-manager \
            --add-repo \
            https://download.docker.com/linux/centos/docker-ce.repo

        #Install Docker

        #Update the yum package index
        yum makecache fast

        #install a specific version of Docker
        yum -y install docker-ce-$dockerVersion

        # create device mapper storage
        touch  /etc/docker/daemon.json
        echo '{ "storage-driver": "devicemapper" } ' > /etc/docker/daemon.json

        # Start Docker
        service docker start
     }


    # Install docker compose version
    function installDockerCompose() {
        curl -L https://github.com/docker/compose/releases/download/$dockerComposeVersion/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        # Apply executable permissions to the binary
        chmod +x /usr/local/bin/docker-compose
     }


    function verifyInstall() {
       # Test Docker Installation
        docker run hello-world
       # Test docker compose installation
       docker-compose --version
     }
    # Start running script
    unInstallDocker
    installDocker
    installDockerCompose
    exit
    verifyInstall
SudoUser

