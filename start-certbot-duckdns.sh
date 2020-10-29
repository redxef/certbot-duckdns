#!/usr/bin/env sh

set -x

dhparamfile='/etc/letsencrypt/ssl-dhparams.pem'
ssl_includefile='/etc/letsencrypt/options-ssl-nginx.conf'

echo "Updating duckdns record"
duckdns
echo "Acquiering letsencrypt certificates"
certbot-duckdns
echo "Starting crond"
exec crond -f
