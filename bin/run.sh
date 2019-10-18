#!/bin/bash -

set -e


/etc/nginx/sbin/nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
