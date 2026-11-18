# 21.04 seems to be the oldest that supports python 3.9.0
# Steam advices developers to use the LTS version, currently at 26.04
FROM ubuntu:26.04

ENV DEBIAN_FRONTEND=noninteractive

# Install build dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    gcc \
    g++ \
    make \
    python3 \
    python3-pip \
    scons \
    git \
    pkg-config \
    ca-certificates \
    && rm -rf /var/lib/apt/lists/*

# Install SCons
# apparently, this is how its done on older ubuntu's
# the latest installs scons via apt-get
#RUN pip3 install scons

# Set working directory
WORKDIR /project

# Default command
CMD ["/bin/bash"]
