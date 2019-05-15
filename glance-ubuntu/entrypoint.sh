#!/bin/bash

if [ -z $SKIP_SYNCDB ]; then
    echo "DB sync"
    glance-manage db sync
fi

echo 'export PS1="[\u@glance-${COMPONENT}] \W # "' >> /root/.bash_profile

echo "Starting glance ${COMPONENT} service"
/usr/bin/glance-${COMPONENT}
