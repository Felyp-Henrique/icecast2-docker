# Icecast2 Docker

Flexible image Docker to create server Icecast2

# Instalation and configuration
Below follows all way to config the server using the Docker image. It's separated for three section: first **Normal run**, where show the load of image and execution with some environment variables of configuration. Second **Service run**, show the example of Docker Compose and for last the **Table of environment variable**.

## Normal run
Run this sequence of code in your command line:
```shell
docker pull perl19/icecast2
docker run -p 8000:8000 perl19/icecast2
```

You can use configuration default of Icecast2 to hostname, user admin and password or to use custom configuration.

> See below list of environment variable and your functionality

```shell
docker run \
    -p 8000:8000 \
    -e IC_AUTH_ADMIN=root \
    -e IC_AUTH_ADMIN_PASS=toor \
    -e IC_SOURCE_PASS=source_pass \
    perl19/icecast2
```

## Service run
In this repository there is an file named as *docker-compose.yml* as example for create a simple service in Docker.

Save this code in a file named *any-name.yml*:
```yml
version: '3'
services:
        icecast:
                image: perl19/icecast2
                environment:
                        - IC_AUTH_ADMIN=admin
                        - IC_AUTH_ADMIN_PASS=hackme
                        - IC_SOURCE_PASS=hackme
                        - IC_HOSTNAME=localhost
                        - IC_PORT=8000
                        - IC_LIMITS_CLIENTS=1000
                        - IC_LIMITS_SOURCES=1
                        - IC_LIMITS_QUEUE_SIZE=524288
                        - IC_LIMITS_BURST_SIZE=65535
                        - IC_LIMITS_CLIENT_TIMEOUT=30
                        - IC_LIMITS_HEADER_TIMEOUT=15
                        - IC_LIMITS_SOURCE_TIMEOUT=10
                ports:
                        - "8000:8000"
```
And run this command in your command line:
```shell
docker swarm init
docker stack deploy --compose-file any-name.yml name-service
```

With this file, you have enough to run service.

## Table of environment variable
The list of environment variable, your functionality and default values:

|Variable|Descrition|Default|
|:---|:---|:---|
|IC_AUTH_ADMIN|Set the namo of administrator|admin|
|IC_AUTH_ADMIN_PASS|Set the password of administrator|hackme|
|IC_SOURCE_PASS|Set the passoword of user source|hackme|
|IC_HOSTNAME|Set the hostname of server|localhost|
|IC_PORT|Set the port of server|8000|
|IC_LIMITS_CLIENTS|Set the limit of connection in your server|1000|
|IC_LIMITS_SOURCES|Set the limit of source mount in your server|1|
|IC_LIMITS_QUEUE_SIZE|Set queue size|524288|
|IC_LIMITS_BURST_SIZE|Set burst size|65535|
|IC_LIMITS_CLIENT_TIMEOUT|Timeout of client|30|
|IC_LIMITS_HEADER_TIMEOUT|Timeout of header|15|
|IC_LIMITS_SOURCE_TIMEOUT|Timeout of source|10|
