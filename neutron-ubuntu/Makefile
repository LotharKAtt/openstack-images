REGISTRY=quay.io
REGISTRY_NAMESPACE=lotharkatt
VERSION=latest

help:
	@echo "Available options:"
	@echo "  build-neutron          build of all images"
	@echo "  build-neutron-base     build of base image"
	@echo "  build-neutron-server    build of admin image"
	@echo "  build-neutron-metadata-agent     build of metadata agent image"
	@echo "  build-neutron-dhcp-agent     build of dhcp agent image"
	@echo "  build-neutron-l3-agent     build of l3 agent image"
	@echo "  build-neutron-openvswitch-agent     build of openvswitch agent image"
	@echo "  push                    push all images to registry"

build-neutron: \
	build-neutron-base \
	build-neutron-server \
	build-neutron-metadata-agent \
	build-neutron-dhcp-agent \
	build-neutron-openvswitch-agent \
	build-neutron-l3-agent

build-neutron-base:
	@echo "== Building neutron-base"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-base:${VERSION} -f neutron-base.Dockerfile .

build-neutron-server:
	@echo "== Building neutron-server"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-server:${VERSION} -f neutron-server.Dockerfile .

build-neutron-metadata-agent:
	@echo "== Building neutron-metadata-agent"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-metadata-agent:${VERSION} -f neutron-metadata-agent.Dockerfile .

build-neutron-dhcp-agent:
	@echo "== Building neutron-dhcp-agent"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-dhcp-agent:${VERSION} -f neutron-dhcp-agent.Dockerfile .

build-neutron-l3-agent:
	@echo "== Building neutron-l3-agent"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-l3-agent:${VERSION} -f neutron-l3-agent.Dockerfile .

build-neutron-openvswitch-agent:
	@echo "== Building neutron-openvswitch-agent"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-openvswitch-agent:${VERSION} -f neutron-openvswitch-agent.Dockerfile .

push:
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-base:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-server:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-metadata-agent:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-dhcp-agent:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-l3-agent:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-openvswitch-agent:${VERSION}
