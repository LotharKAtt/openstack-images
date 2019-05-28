#!/bin/bash

# TODO: Init container
keystone-manage fernet_setup --keystone-user root --keystone-group root
keystone-manage bootstrap \
    --bootstrap-password cloudlab \
    --bootstrap-username admin \
    --bootstrap-project-name admin \
    --bootstrap-role-name admin \
    --bootstrap-service-name keystone \
    --bootstrap-region-id RegionOne \
    --bootstrap-admin-url http://keystone-pbl-svc:5000 \
    --bootstrap-public-url http://keystone-pbl-svc:5000 \
    --bootstrap-internal-url http://keystone-pbl-svc:5000



# openstack domain create --description "Default Domain" default
# openstack user create --domain default --password cloudlab admin
# openstack project create --domain default --description "Service Project" service

cat >~/openrc <<EOF
export OS_IDENTITY_API_VERSION=3
export OS_AUTH_URL=http://keystone-pbl-svc:5000/v3
export OS_PROJECT_DOMAIN_NAME=default
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=cloudlab
export OS_REGION_NAME=RegionOne
export OS_INTERFACE="internal"
export OS_ENDPOINT_TYPE="internal"
EOF
