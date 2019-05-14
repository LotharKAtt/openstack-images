FROM ubuntu:16.04
# TRANSFORM TO ALPINE

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    apt update && \
    apt install neutron-server python-neutron-lbaas gettext-base python-pycadf -y &&\
    apt install python-openstackclient -y

COPY neutron.conf /etc/neutron/neutron.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT [ "/entrypoint.sh" ]
