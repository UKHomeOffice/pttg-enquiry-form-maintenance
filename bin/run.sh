#!/bin/bash -

set -e
nginx -g 'daemon off;' -c /etc/nginx/nginx.conf
