
REGISTRY=quay.io
REGISTRY_NAMESPACE=lotharkatt
VERSION=latest

help:
	@echo "Available options:"
	@echo "  keystone-build          build of all images"
	@echo "  build-glance-base       build of base image"
	@echo "  build-glance-api        build of api image"
	@echo "  build-glance-registry   build of registry image"
	@echo "  push                    push all images to registry"

glance-build: \
	build-glance-base \
	build-glance-api \
	build-glance-registry

build-glance-base:
	@echo "== Building glance-base"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/glance-base:${VERSION} -f glance-base.Dockerfile .

build-glance-api:
	@echo "== Building glance-api"
	#TODO: make it universal
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/glance-api:${VERSION} -f glance-api.Dockerfile .

build-glance-registry:
	@echo "== Building glance-registry"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/glance-registry:${VERSION} -f glance-registry.Dockerfile .

push:
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/glance-base:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/glance-registry:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/glance-api:${VERSION}
