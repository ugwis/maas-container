FROM ubuntu:22.04

ARG MAAS_VERSION

RUN apt-get update -y && \
    apt-get install -y software-properties-common sudo && \
    apt-get update -y && \
    apt-add-repository ppa:maas/${MAAS_VERSION} && \
    DEBIAN_FRONTEND="noninteractive" apt-get install maas -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN systemctl enable maas-regiond maas-rackd maas-http postgresql

EXPOSE 5240

CMD ["/sbin/init"]
