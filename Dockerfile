FROM python:3

LABEL maintainer Aleksandr.Makhinov <monaxgt@gmail.com>

RUN apt upgrade \ 
    && apt install git  \
                   bash \
                   gcc \
                   g++ \
                   make  \
                   libtool \
                   libssl-dev \ 
                   zlib1g-dev \
                   libbz2-dev \
                   libreadline-dev \
    && pip3 install --upgrade setuptools pip wheel psutil \
    && git clone https://github.com/google/rekall.git rekall \
    && pip3 install --editable rekall/rekall-lib \
    && pip3 install --editable rekall/rekall-core \
    && pip3 install --editable rekall/rekall-agent \
    && pip3 install --editable rekall \
    && apt clean autoclean \
    && apt autoremove --yes \
    && rm -rf /var/lib/{apt,dpkg,cache,log}/* \
    && rm -rf /tmp/* /root/.cache  /var/tmp/* \
VOLUME /data
WORKDIR /data
ENV PATH /sbin:$PATH

ENTRYPOINT ["rekall"]
