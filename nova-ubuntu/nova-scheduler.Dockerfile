FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT scheduler

#EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
