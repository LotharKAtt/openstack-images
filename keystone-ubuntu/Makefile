REGISTRY=quay.io
REGISTRY_NAMESPACE=lotharkatt
VERSION=latest

help:
	@echo "Available options:"
	@echo "  build-keystone          build of all images"
	@echo "  build-keystone-base     build of base image"
	@echo "  build-keystone		 build of public image"
	@echo "  push                    push all images to registry"

build-keystone: \
	build-keystone-base \
	build-keystone

build-keystone-base:
	@echo "== Building keystone-base"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-base:${VERSION} -f keystone-base.Dockerfile .

build-keystone:
	@echo "== Building keystone"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone:${VERSION} -f keystone.Dockerfile .

push:
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-base:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone:${VERSION}
