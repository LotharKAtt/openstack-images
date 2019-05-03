FROM quay.io/lotharkatt/glance-base:latest
ENV COMPONENT api

EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
