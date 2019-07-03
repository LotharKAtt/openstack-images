FROM ubuntu:16.04
# TRANSFORM TO ALPINE

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    apt update && \
    apt install uwsgi uwsgi-plugin-python -y &&\
    apt install keystone python-openstackclient -y

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]
