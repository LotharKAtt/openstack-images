#!bin/bash

# VYMYSLET JINAK az bude cas

keystone-manage db_sync
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

# ADMIN_TOKEN=${ADMIN_TOKEN:-294a4c8a8a475f9b9836}
# ADMIN_TENANT_NAME=admin
# ADMIN_USER_NAME=admin
# ADMIN_PASSWORD=cloudlab
# ADMIN_EMAIL=admin@example.com
# OS_TOKEN=$ADMIN_TOKEN
# OS_IDENTITY_API_VERSION=35357

# export OS_TOKEN OS_URL OS_IDENTITY_API_VERSION

openstack service create --name keystone --description "OpenStack Identity" identity
openstack endpoint create --region RegionOne identity public http://keystone-pbl-svc:5000/v3
openstack endpoint create --region RegionOne identity internal http://keystone-pbl-svc:5000/v3
openstack endpoint create --region RegionOne identity admin http://keystone-pbl-acsvc:5000/v3
openstack domain create --description "Default Domain" default
openstack project create --domain default  --description "Admin Project" admin
openstack user create --domain default --password cloudlab admin
openstack role create admin
openstack project create --domain default --description "Admin Project" admin
openstack role add --project admin --user admin admin


openstack project create --domain default --description "Service Project" service

openstack user create --domain default --password cloudlab neutron
openstack service create --name neutron --description "OpenStack Networking" network
openstack endpoint create --region RegionOne network public http://neutron-svc:9696
openstack endpoint create --region RegionOne network admin http://neutron-svc:9696
openstack endpoint create --region RegionOne network internal http://neutron-svc:9696
openstack role add --project service --user neutron admin



openstack user create --domain default --password cloudlab glance
openstack service create --name glance --description "OpenStack Image" image
openstack endpoint create --region RegionOne image public http://glance-svc:9292
openstack endpoint create --region RegionOne image admin http://glance-svc:9292
openstack endpoint create --region RegionOne image internal http://glance-svc:9292
openstack role add --project service --user glance admin





cat >~/openrc <<EOF
export OS_IDENTITY_API_VERSION=3
export OS_AUTH_URL=http://keystone-adm-svc:35357/v3
export OS_PROJECT_DOMAIN_NAME=default
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=cloudlab
export OS_REGION_NAME=RegionOne
export OS_INTERFACE="internal"
export OS_ENDPOINT_TYPE="internal"
EOF
