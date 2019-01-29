FROM alpine:3.8 as build


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

RUN git clone https://github.com/openstack/keystone.git -b stable/queens keystone
RUN pip install --upgrade pip
RUN pip install /build/keystone
RUN pip install dogpile.cache==0.6.2


FROM alpine:3.8
## GIT PULL

RUN apk add --update \
        python \
        py-pip \
        uwsgi \
        mysql-client \
    && rm -rf /var/cache/apk/* /tmp/* /var/tmp/*


COPY --from=build /build/keystone /srv/keystone
## GIT PULL
#RUN

RUN addgroup -S keystone && \
    adduser -S -G keystone keystone && \
    mkdir /var/log/keystone && \
    ln -s /srv/keystone/etc /etc/keystone && \
    chown keystone:keystone /var/log/keystone
#    sed -i s,/home/keystone,/var/lib/keystone,g /etc/passwd

# Entrypoint
#TODO []
