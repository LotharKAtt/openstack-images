FROM alpine:3.8 as builder

ENV OPENSTACK_VERSION=queens
WORKDIR /build

## Install build tools
RUN apk add --update \
        python-dev \
        py-pip \
        py-virtualenv \
#        openssl-dev \
        libxml2-dev \
        libxslt-dev \
        mariadb-dev \
        make \
        gcc \
        linux-headers \
        musl-dev \
        libffi-dev \
        git \
        && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*

RUN git clone https://github.com/openstack/keystone.git -b stable/$OPENSTACK_VERSION keystone && \
    virtualenv venv && source venv/bin/activate && \
    pip install --upgrade pip && \
    pip install /build/keystone && \
    pip install dogpile.cache==0.6.2 && \
    tar cvf /build/keystone.tar.gz /build/keystone*



#FROM alpine:3.8
### GIT PULL
#
#RUN apk add --update \
#        python \
#        py-pip \
#        uwsgi \
#        mysql-client \
#    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*
#
#
#COPY --from=build /build/keystone.tar.gz /srv/keystone.tar.gz
### GIT PULL
##RUN
#RUN tar xvf /srv/keystone.tar.gz -C /srv && rm /srv/keystone.tar.gz &&\
#    #mv /srv/keystone/venv/* /opt/keystone/ && rmdir /opt/keystone/venv && \
##        for i in /opt/keystone/bin/*; do sed -i 's,^#!.*/bin/python,#!/opt/keystone/bin/python,g' $i; done && \
#    #chown -R root:root /opt/keystone && \
#    ln -s /opt/keystone/etc/keystone /etc/keystone && \
#
#    addgroup -S   && \
#    adduser -S -G keystone keystone && \
#    mkdir /var/log/keystone && \
#    ln -s /srv/keystone/etc /etc/keystone && \
#    chown keystone:keystone /var/log/keystone
##    sed -i s,/home/keystone,/var/lib/keystone,g /etc/passwd
#
#RUN echo 'export PS1="[\u@keystone-$role] \W # "' >> /root/.bash_profile



