FROM ubuntu:latest
ENV REFRESHED_AT 2022-06-01

# Download Linux support tools
RUN apt-get update && \
    apt-get clean && \
    apt-get install -y \
            build-essential \
            wget \
            curl \
            git

# Set up a development tools directory
WORKDIR /home/dev
ADD . /home/dev

# RUN wget -qO- https://developer.arm.com/-/media/Files/downloads/gnu-rm/9-2019q4/gcc-arm-none-eabi-9-2019-q4-major-x86_64-linux.tar.bz2 | tar -xj
RUN wget -O- https://developer.arm.com/-/media/Files/downloads/gnu-rm/10.3-2021.10/gcc-arm-none-eabi-10.3-2021.10-x86_64-linux.tar.bz2 | tar -xj

# Set up the compiler path
ENV PATH $PATH:/home/dev/gcc-arm-none-eabi-10.3-2021.10/bin

WORKDIR /home/app
