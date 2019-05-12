FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT placement

#EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
