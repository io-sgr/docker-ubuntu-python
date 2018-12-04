FROM ubuntu:latest
MAINTAINER SgrAlpha <admin@mail.sgr.io>

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=C.UTF-8

RUN \
	apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install \
		ca-certificates \
		curl \
		apt-utils \
		python3 \
		python3-distutils \
		--no-install-recommends -y && \
	apt-get autoclean && \
	apt-get autoremove --purge -y && \
	update-alternatives --install /usr/bin/python python /usr/bin/python3 10 && \
	curl -OsS https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py && \
	pip install setuptools wheel && \
	rm -rf get-pip.py ~/.cache/pip/* /var/lib/apt/lists/* /var/cache/apt/* /tmp/* /var/tmp/*
