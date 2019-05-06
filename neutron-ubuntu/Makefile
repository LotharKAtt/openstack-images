REGISTRY=quay.io
REGISTRY_NAMESPACE=lotharkatt
VERSION=latest

help:
	@echo "Available options:"
	@echo "  neutron-build          build of all images"
	@echo "  build-neutron-base     build of base image"
	@echo "  build-neutron-server    build of admin image"
	@echo "  push                    push all images to registry"

neutron-build: \
	build-neutron-base \
	build-neutron-server

build-neutron-base:
	@echo "== Building neutron-base"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-base:${VERSION} -f neutron-base.Dockerfile .

build-neutron-server:
	@echo "== Building neutron-server"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-server:${VERSION} -f neutron-server.Dockerfile .

push:
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-base:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/neutron-server:${VERSION}
