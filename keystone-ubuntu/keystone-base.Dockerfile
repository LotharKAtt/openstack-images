FROM ubuntu:16.04
# TRANSFORM TO ALPINE

ENV ADMIN_TOKEN=${ADMIN_TOKEN:-294a4c8a8a475f9b9836}
ENV ADMIN_TENANT_NAME=${ADMIN_TENANT_NAME:-admin}
ENV ADMIN_USER_NAME=${ADMIN_USERNAME:-admin}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD:-ADMIN_PASS}
ENV ADMIN_EMAIL=${ADMIN_EMAIL:-${ADMIN_USER_NAME}@example.com}

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    apt install uwsgi uwsgi-plugin-python -y &&\
    apt install keystone python-openstackclient -y

COPY keystone.conf /etc/keystone/keystone.conf
COPY bootstrap.sh /bootstrap.sh

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
