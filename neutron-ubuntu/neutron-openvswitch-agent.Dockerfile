
FROM quay.io/lotharkatt/neutron-base:latest
ENV COMPONENT openvswitch-agent

ENTRYPOINT ["/entrypoint.sh"]
