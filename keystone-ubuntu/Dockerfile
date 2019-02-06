FROM ubuntu:16.04

ENV ADMIN_TOKEN=${ADMIN_TOKEN:-294a4c8a8a475f9b9836}
ENV ADMIN_TENANT_NAME=${ADMIN_TENANT_NAME:-admin}
ENV ADMIN_USER_NAME=${ADMIN_USERNAME:-admin}
ENV ADMIN_PASSWORD=${ADMIN_PASSWORD:-ADMIN_PASS}
ENV ADMIN_EMAIL=${ADMIN_EMAIL:-${ADMIN_USER_NAME}@example.com}

RUN apt update && \
    apt install software-properties-common -y && \
    add-apt-repository cloud-archive:queens &&\
    apt install keystone python-openstackclient -y
    


EXPOSE 35357 5000

CMD ["/usr/bin/keystone-all"]

