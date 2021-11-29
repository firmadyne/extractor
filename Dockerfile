FROM ubuntu:20.04

WORKDIR /root

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
      build-essential \
      git-core \
      liblzma-dev \
      liblzo2-dev \
      python3-pip \
      unrar-free \
      wget \
      zlib1g-dev && \
    update-alternatives --install /usr/bin/python python /usr/bin/python3 10 # python should be py3

RUN git clone -q --depth=1 https://github.com/devttys0/binwalk.git /root/binwalk && \
    cd /root/binwalk && \
    ./deps.sh --yes && \
    python3 ./setup.py install && \
    pip3 install git+https://github.com/ahupp/python-magic && \
    pip3 install git+https://github.com/sviehb/jefferson && \
    pip3 install pylzma # jefferson dependency, needs build-essential

COPY extractor.py /root/
WORKDIR /root/
