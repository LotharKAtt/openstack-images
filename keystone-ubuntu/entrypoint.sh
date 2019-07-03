#!/bin/bash
#PUT IT TO SH NO BASH ON ALPINE

# FIXME
if [[ -f /proc/cpuinfo && -z "$WORKERS" ]]; then
    WORKERS=$[ $(grep -c processor /proc/cpuinfo) * 2 + 1 ]
fi

BIND_PORT=5000


echo 'export PS1="[\u@keystone] \W # "' >> /root/.bash_profile

echo "Starting keystone ${COMPONENT} service"
uwsgi --plugin http --plugin python --http :${BIND_PORT} --workers ${WORKERS} --wsgi-file $(which keystone-wsgi-public)
