FROM ubuntu:16.04

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    apt install uwsgi uwsgi-plugin-python -y &&\
    apt install nova-api nova-common nova-conductor nova-consoleauth nova-placement-api nova-scheduler python-openstackclient -y

COPY nova.conf /etc/nova/nova.conf

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]