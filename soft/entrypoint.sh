#!/bin/bash

set -e

if [ $# -gt 0 ]; then
    exec $@
else
    /usr/local/php/sbin/php-fpm -D &
    /usr/local/nginx/sbin/nginx -g "daemon off;"
fi
