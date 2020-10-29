FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add curl certbot openssl

RUN mkdir /etc/cron.d
COPY certbot-* duckdns start-certbot-duckdns.sh /usr/local/bin/
COPY etc/cron.d/* /etc/cron.d/

ENTRYPOINT ["start-certbot-duckdns.sh"]
CMD []
