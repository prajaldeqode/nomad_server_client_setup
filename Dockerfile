FROM ubuntu
RUN apt-get update
RUN apt-get -y upgrade

RUN apt-get install -y \
        wget \
        unzip \
        && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://releases.hashicorp.com/nomad/1.1.3/nomad_1.1.3_linux_amd64.zip && \
    unzip nomad_1.1.3_linux_amd64.zip && \
    mv nomad /usr/local/bin/ && \
    rm nomad_1.1.3_linux_amd64.zip
RUN apt update
RUN apt install -y nano
RUN apt install -y iputils-ping