FROM quay.io/lotharkatt/nova-base:latest
ENV COMPONENT novncproxy

#EXPOSE 9292
ENTRYPOINT ["/entrypoint.sh"]
