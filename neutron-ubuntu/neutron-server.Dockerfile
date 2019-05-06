FROM quay.io/lotharkatt/neutron-base:latest
ENV COMPONENT server

EXPOSE 9696
ENTRYPOINT ["/entrypoint.sh"]
