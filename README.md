# kristinjeanna/docker-ubuntu-jdk8

[![GitHub license](https://img.shields.io/github/license/kristinjeanna/docker-ubuntu-jdk8.svg?style=flat)](https://github.com/kristinjeanna/docker-ubuntu-jdk8/blob/main/LICENSE) [![Latest Docker tag](https://img.shields.io/docker/v/kristinjeanna/ubuntu-jdk8/latest?style=flat)](https://hub.docker.com/repository/docker/kristinjeanna/ubuntu-jdk8) ![Last commit](https://img.shields.io/github/last-commit/kristinjeanna/docker-ubuntu-jdk8?style=flat)

A Docker image based on `kristinjeanna/ubuntu` that serves as the base image for my downstream Ubuntu-based Docker images that need JDK 8. Includes `tini` as the PID 0 process and runs as a user named "default".

- [Requirements](#requirements)
- [How to obtain the image](#how-to-obtain-the-image)
  - [Pull from Docker Hub](#pull-from-docker-hub)
  - [Manually building the image](#manually-building-the-image)
    - [Method 1](#method-1)
    - [Method 2](#method-2)
- [Run the image](#run-the-image)
- [See also](#see-also)

## Requirements

- [Docker](https://www.docker.com/get-started)

## How to obtain the image

### Pull from Docker Hub

```shell
docker pull kristinjeanna/ubuntu-jdk8
```

### Manually building the image

First, clone this repo. Then, use one of the following two methods to create the Docker image. The image will be labelled `kristinjeanna/ubuntu-jdk8:latest` and can be used to construct downstream images.

#### Method 1

At a command prompt, `cd` to the source directory of the cloned repo, and build with:

```shell
./build.sh
```

This script will scrub a previous `kristinjeanna/ubuntu-jdk8` image prior to performing the build.

#### Method 2

At a command prompt, `cd` to the source directory of the cloned repo, and build with:

```shell
docker build -t kristinjeanna/ubuntu-jdk8 -f Dockerfile .
```

## Run the image

The following runs the image and results in a bash prompt in the running container:

```shell
docker run -ti --rm kristinjeanna/ubuntu-jdk8
```

By default, the image runs as a user named "default". To run as root, add `--user=root` to the command:

```shell
docker run -ti --rm --user=root kristinjeanna/ubuntu-jdk8
```

## See also

- [`kristinjeanna/ubuntu-jdk8` on Docker Hub](https://hub.docker.com/repository/docker/kristinjeanna/ubuntu-jdk8)
- [`kristinjeanna/ubuntu-jre8` on Docker Hub](https://hub.docker.com/repository/docker/kristinjeanna/ubuntu-jre8)
- [`kristinjeanna/ubuntu` on Docker Hub](https://hub.docker.com/repository/docker/kristinjeanna/ubuntu)
- [`kristinjeanna/docker-ubuntu-jre8` on GitHub](https://github.com/kristinjeanna/docker-ubuntu-jre8)
- [`kristinjeanna/docker-ubuntu` on GitHub](https://github.com/kristinjeanna/docker-ubuntu)
- [tini](https://github.com/krallin/tini) init
