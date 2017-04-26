FROM sgrio/ubuntu-base
MAINTAINER SgrAlpha <admin@mail.sgr.io>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN \
	apt-get update && \
	apt-get dist-upgrade -y && \
	apt-get install \
		ca-certificates \
		curl \
		python \
		--no-install-recommends -y && \
	apt-get autoclean && \
	apt-get autoremove --purge -y && \
	curl -OsS https://bootstrap.pypa.io/get-pip.py && \
	python get-pip.py --no-setuptools && \
	rm -rf get-pip.py ~/.cache/pip/* /var/lib/apt/lists/* /var/cache/apt/* /tmp/* /var/tmp/*
