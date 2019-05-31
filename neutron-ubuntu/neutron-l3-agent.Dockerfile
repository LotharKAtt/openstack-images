
FROM quay.io/lotharkatt/neutron-base:latest
ENV COMPONENT l3-agent

ENTRYPOINT ["/entrypoint.sh"]
