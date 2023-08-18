# Docker template

In this repository you find a template for a docker container.

## Prerequisites

Docker installed on your system, rootless support recommended

## Structure

- Makefile -> manages the building/recreation of docker images/container
- docker -> folder containing all files used during the build the container
    - Dockerfile -> Description of the image
    - docker-compose.yml -> Configuration of the container

Setup:

1. Clone this repository into any directory
2. Adapt the Dockerfile to your needs
3. Adapt the docker-compose.yaml file to your needs
4. Build the container

## Preparations/Configurations

### Dockerfile
In the Dockerfile there is a section for commands that should be run as root and one section for commands that should be run as user.
The user will be created with the useradd command and with the `ENV USER='andi'` command the name of the user is defined.
The name of the user is also the password when executing a command inside the container as root.

### Container name

In the docker-compose.yml the name of the service will be defined. Currently it's `service_name`. If you change this to your desire, you have to replace the `service_name` in the Makefile as well.

### Mounting volumes from host

Use the volumes property of the docker-compose.yml file
Inside the docker-compose file, files from the host will be mounted into the container - in the home directory of the user to be exact. 
If you changed the name of the user in the Dockerfile, you will have to replace the according path in the volumes property.

### RC files

Changes in files inside the container that are not mounted from the host, will disappear when recreating the container!
As you maybe want to have a custom .bashrc file in your container, there is a default_bash_rc file in the ./docker directory that is mounted into the container during creation of the container.
Adaptions to your .bashrc file in the container should be done in the default_bash_rc file.

## Usage

By using the `make` command in the home directory of this repository, all the necessary steps from building the image to entering the container will be automatically executed.
If you only change configurations in the docker-compose file after the first build, execute again `make` and only the container will be recreated.


## Troubleshooting

- If you have an older docker version, you might not be able to execute the `docker compose` command but the `docker-compose`. To solve this either:
    - Upgrade docker
    - Replace `docker compose` with `docker-compose` in the Makefile
- Networking issue:
    - Having issues to access the network interfaces from inside your container although you activated network mode `host`? Try to add sudo in the Makefile in front of every docker command
