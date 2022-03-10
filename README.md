# Certbot with duckdns wildcard certificate

Just run it with the correct environment variables and enjoy.

Because of a limitation on duckdns it is not possible to
request a certificate which works for both the domain and
wildcard subdomains. Because of this we request 2 certificates,
one for the domain and one wildcard cert.

**Example:**

```
docker run --rm \
    -e DUCKDNS_DOMAIN=redxef \
    -e DUCKDNS_TOKEN=<your ddns token> \
    -e LE_EMAIL=noreply@example.com \
    redxef/certbot-duckdns
```

`DUCKDNS_DOMAIN=redxef`

Yields 2 certificates, the first being for redxef.duckdns.org and the
second being for \*.redxef.duckdns.org. These certificates can be found
under the following locations respectively:

- `/etc/letsencrypt/live/redxef.duckdns.org/`
- `/etc/letsencrypt/live/redxef.duckdns.org-0001/`

## ENV Variables

- DUCKDNS_DOMAIN: The domain to update, ex: DUCKDNS_DOMAIN=redxef for redxef.duckdns.org
- DUCKDNS_TOKEN: Your duckdns api token
- LE_EMAIL: Your email for certificate related notifications

## SOURCE

[gitea.redxef.at/redxef/certbot-duckdns](https://gitea.redxef.at/redxef/certbot-duckdns)
