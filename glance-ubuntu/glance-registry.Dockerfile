FROM quay.io/lotharkatt/glance-base:latest

ENV COMPONENT registry
EXPOSE 9191

ENTRYPOINT [ "/entrypoint.sh" ]
