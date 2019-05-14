FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT api

EXPOSE 8774
ENTRYPOINT ["/entrypoint.sh"]
