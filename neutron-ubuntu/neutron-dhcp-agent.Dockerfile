FROM quay.io/lotharkatt/neutron-base:latest
ENV COMPONENT dhcp-agent

ENTRYPOINT ["/entrypoint.sh"]
