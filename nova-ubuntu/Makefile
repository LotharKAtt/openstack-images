
REGISTRY=quay.io
REGISTRY_NAMESPACE=lotharkatt
VERSION=latest

help:
	@echo "Available options:"
	@echo "  nova-build               build of all images"
	@echo "  build-nova-base          build of base image"
	@echo "  build-nova-api           build of api image"
	@echo "  build-nova-conductor     build of registry image"
	@echo "  build-nova-novncproxy    build of novncproxy"
	@echo "  build-nova-consoleauth   build of consloleauth"
	@echo "  build-nova-scheduler     build of nova scheduler"
	@echo "  push                     push all images to registry"

glance-build: \
	build-nova-base \
	build-nova-api \
	build-nova-conductor \
	build-nova-novncproxy \
	build-nova-consoleauth \
	build-nova-scheduler


build-nova-base:
	@echo "== Building glance-base"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-base:${VERSION} -f nova-base.Dockerfile .

build-nova-api:
	@echo "== Building nova-api"
	#TODO: make it universal
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-api:${VERSION} -f nova-api.Dockerfile .

build-nova-consoleauth:
	@echo "== Building nova-consoleauth"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-consoleauth:${VERSION} -f nova-consoleauth.Dockerfile .

build-nova-conductor:
	@echo "== Building nova-conductor"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-conductor:${VERSION} -f nova-conductor.Dockerfile .

build-nova-novncproxy:
	@echo "== Building nova-novncproxy"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-novncproxy:${VERSION} -f nova-novncproxy.Dockerfile .

build-nova-scheduler:
	@echo "== Building nova-scheduler"
	docker build -t ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-scheduler:${VERSION} -f nova-scheduler.Dockerfile .

push:
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-base:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-api:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-conductor:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-consoleauth:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-novncproxy:${VERSION}
	docker push ${REGISTRY}/${REGISTRY_NAMESPACE}/nova-scheduler:${VERSION}
