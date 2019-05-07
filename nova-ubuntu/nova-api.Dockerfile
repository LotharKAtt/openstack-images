FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT api

#EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
