FROM ubuntu:16.04
# TRANSFORM TO ALPINE

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    # glance-registry will be DEPREC in S release.
    apt install glance glance-api glance-registry glance-common python-glance python-glance-store python-glanceclient gettext-base python-memcache python-pycadf -y &&\
    apt install python-openstackclient -y

COPY glance-api.conf /etc/glance/glance-api.conf
COPY glance-registry.conf /etc/glance/glance-registry.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
