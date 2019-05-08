REGISTRY=quay.io
REGISTRY_NAMESPACE=lotharkatt
VERSION=latest

help:
	@echo "Available options:"
	@echo "  build-keystone          build of all images"
	@echo "  build-keystone-base     build of base image"
	@echo "  build-keystone-admin    build of admin image"
	@echo "  build-keystone-public   build of public image"
	@echo "  push                    push all images to registry"

build-keystone: \
	build-keystone-base \
	build-keystone-admin \
	build-keystone-public

build-keystone-base:
	@echo "== Building keystone-base"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-base:${VERSION} -f keystone-base.Dockerfile .

build-keystone-admin:
	@echo "== Building keystone-wsgi-admin"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-wsgi-admin:${VERSION} -f keystone-admin.Dockerfile .

build-keystone-public:
	@echo "== Building keystone-wsgi-public"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-wsgi-public:${VERSION} -f keystone-public.Dockerfile .

push:
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-base:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-wsgi-public:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/keystone-wsgi-admin:${VERSION}
