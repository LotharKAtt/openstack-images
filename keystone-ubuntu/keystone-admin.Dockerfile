FROM quay.io/lotharkatt/keystone-base:latest
ENV COMPONENT admin

EXPOSE 35357
ENTRYPOINT ["/entrypoint.sh"]
