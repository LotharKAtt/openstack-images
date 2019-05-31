FROM quay.io/lotharkatt/neutron-base:latest
ENV COMPONENT metadata-agent

ENTRYPOINT ["/entrypoint.sh"]
