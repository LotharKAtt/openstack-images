#!/bin/bash
#PUT IT TO SH NO BASH ON ALPINE

# FIXME
if [[ -f /proc/cpuinfo && -z "$WORKERS" ]]; then
    WORKERS=$[ $(grep -c processor /proc/cpuinfo) * 2 + 1 ]
fi

if [ "$COMPONENT" == 'admin' ]; then
    BIND_PORT=35357
else
    BIND_PORT=5000
fi

if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    keystone-manage db_sync
fi

if [ -z $SKIP_FERNET ]; then
    echo "Setup keystone fernet tokens"
    # run it under keystone user
    keystone-manage fernet_setup --keystone-user root --keystone-group root
fi

echo 'export PS1="[\u@keystone-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting keystone ${COMPONENT} service"
uwsgi --plugin http --plugin python --http :${BIND_PORT} --workers ${WORKERS} --wsgi-file $(which keystone-wsgi-${COMPONENT})
