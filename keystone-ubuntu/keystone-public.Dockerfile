FROM quay.io/lotharkatt/keystone-base:latest
ENV COMPONENT public

EXPOSE 5000
ENTRYPOINT ["/entrypoint.sh"]
