FROM python:3.9.7-buster

RUN apt update && apt -y install git \
    gcc \
    g++ \
    ca-certificates \
    dnsutils \
    curl \
    iproute2 \
    ffmpeg \
    procps \
    build-essential \
    libpq-dev \
    python3-dev \
    python3-pip \
    python3-setuptools \
    python3-wheel \
    python3-venv \
    && useradd -m -d /home/container container

USER container
ENV USER=container HOME=/home/container
WORKDIR /home/container

COPY ./../entrypoint.sh /entrypoint.sh
CMD [ "/bin/bash", "/entrypoint.sh" ]