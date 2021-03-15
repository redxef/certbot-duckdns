FROM alpine:latest

RUN apk update && apk upgrade \
    && apk add \
         curl \
         certbot \
         openssl

RUN mkdir -p /etc/periodic/12h \
    && mkdir -p /etc/periodic/5min

COPY certbot-* duckdns start-certbot-duckdns.sh /usr/local/bin/
COPY etc/periodic/ /etc/periodic/

ENTRYPOINT [ "/bin/sh", "-c" ]
CMD [ "duckdns; certbot-duckdns; start-certbot-duckdns.sh" ]
