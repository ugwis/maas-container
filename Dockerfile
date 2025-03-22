FROM ubuntu:22.04

ARG MAAS_VERSION

RUN apt update -y && \
    apt install software-properties-common -y && \
    apt update -y && \
    apt-add-repository ppa:maas/${MAAS_VERSION} && \
    apt install maas -y
