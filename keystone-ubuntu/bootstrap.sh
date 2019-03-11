#!bin/bash


# VYMYSLET JINAK az bude cas

ADMIN_TOKEN=${ADMIN_TOKEN:-294a4c8a8a475f9b9836}
ADMIN_TENANT_NAME=admin
ADMIN_USER_NAME=admin
ADMIN_PASSWORD=cloudlab
ADMIN_EMAIL=admin@example.com

OS_TOKEN=$ADMIN_TOKEN
OS_URL=${OS_AUTH_URL:-"http://keystone:35357/v3"}
OS_IDENTITY_API_VERSION=3


keystone-manage db_sync
keystone-manage fernet_setup --keystone-user root --keystone-group root

export OS_TOKEN OS_URL OS_IDENTITY_API_VERSION



openstack service create  --name keystone identity
openstack endpoint create --region RegionOne identity public http://keystone:5000/v3
openstack endpoint create --region RegionOne identity internal http://keystone:5000/v3
openstack endpoint create --region RegionOne identity admin http://keystone:5000/v3
openstack domain create --description "Default Domain" default
openstack project create --domain default  --description "Admin Project" admin
openstack user create --domain default --password cloudlab admin
openstack role create admin
openstack role add --project admin --user admin admin

cat >~/openrc <<EOF
export OS_PROJECT_DOMAIN_NAME=default
export OS_USER_DOMAIN_NAME=default
export OS_PROJECT_NAME=admin
export OS_USERNAME=admin
export OS_PASSWORD=${ADMIN_PASSWORD}
export OS_AUTH_URL=http://${HOSTNAME}:35357/v3
export OS_IDENTITY_API_VERSION=3
export OS_IMAGE_API_VERSION=2
EOF