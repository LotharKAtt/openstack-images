FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT compute

#EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
