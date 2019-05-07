FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT conductor

#EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
