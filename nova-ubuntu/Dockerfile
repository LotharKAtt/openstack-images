FROM ubuntu:16.04


RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    apt install nova-api python-openstackclient -y

COPY nova.conf /etc/nova/nova.conf
#COPY bootstrap.sh /bootstrap.sh

#EXPOSE 35357 5000
#
#COPY entrypoint.sh /entrypoint.sh
#RUN chmod +x /entrypoint.sh
#
#ENTRYPOINT ["/entrypoint.sh"]
