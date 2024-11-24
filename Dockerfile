FROM ubuntu:24.04

LABEL org.opencontainers.image.source=https://github.com/mjsully/docker-speedtest

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y curl
RUN useradd -ms /bin/bash speedtest
RUN curl -s https://packagecloud.io/install/repositories/ookla/speedtest-cli/script.deb.sh
RUN apt install -y speedtest-cli
USER speedtest

ENTRYPOINT ["speedtest-cli", "--secure"]
