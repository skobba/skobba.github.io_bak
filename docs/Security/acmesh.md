# acme.sh
Ref: https://www.haproxy.com/blog/haproxy-and-let-s-encrypt

## Create user
```sh
adduser \
   --system \
   --disabled-password \
   --home /var/lib/acme \
   acme

adduser acme haproxy
```

## Install acme
```sh
apk add openssl socat git sudo

mkdir -p /usr/local/share/acme.sh

git clone https://github.com/acmesh-official/acme.sh.git
cd acme.sh/
./acme.sh \
   --install \
   --no-cron \
   --no-profile \
   --home /usr/local/share/acme.sh
ln -s /usr/local/share/acme.sh/acme.sh /usr/local/bin/
chmod 755 /usr/local/share/acme.sh/

curl https://raw.githubusercontent.com/haproxy/haproxy/master/admin/acme.sh/haproxy.sh | tee /usr/local/share/acme.sh/deploy/haproxy.sh

```

## Generate your ACME account 
```sh
sudo -u acme -s

acme.sh --register-account \
   --server letsencrypt_test \
   -m gjermund@skobba.net

Result:
touch: /var/lib/acme/.acme.sh/http.header: No such file or directory
[Mon Apr 29 09:50:12 UTC 2024] Create account key ok.
[Mon Apr 29 09:50:12 UTC 2024] Registering account: https://acme-staging-v02.api.letsencrypt.org/directory
[Mon Apr 29 09:50:13 UTC 2024] Registered
[Mon Apr 29 09:50:13 UTC 2024] ACCOUNT_THUMBPRINT='MgqMNzGBSUxKCgZrebIj1Hw84dvAYC_gcYVwd599664'

```

## Configure HAProxy to Respond to HTTP Challenges
Create the directory for certificates:
```sh
mkdir /etc/haproxy/certs
chown haproxy:haproxy /etc/haproxy/certs
chmod 770 /etc/haproxy/certs

mkdir -p /var/run/haproxy
chown haproxy:haproxy /var/run/haproxy
chmod 770 /var/run/haproxy

chown haproxy:haproxy /var/run/haproxy/admin.sock
chmod 770 /var/run/haproxy/admin.sock

```

## Edit /etc/haproxy/haproxy.cfg to add the challenge response
```sh
global
    stats socket /var/run/haproxy/admin.sock level admin mode 660
    setenv ACCOUNT_THUMBPRINT 'MgqMNzGBSUxKCgZrebIj1Hw84dvAYC_gcYVwd599664'

frontend web
    bind :80
    bind :443 ssl crt /etc/haproxy/certs/ strict-sni
    http-request return status 200 content-type text/plain lf-string "%[path,field(-1,/)].${ACCOUNT_THUMBPRINT}\n" if { path_beg '/.well-known/acme-challenge/' }
```

## Generate a certificate 
```sh
sudo -u acme -s
acme.sh --issue \
   -d demo.skobba.net \
   --stateless \
   --server letsencrypt_test --debug

Correct:
[Mon Apr 29 10:25:14 UTC 2024] Your cert is in: /var/lib/acme/.acme.sh/demo.skobba.net_ecc/demo.skobba.net.cer
[Mon Apr 29 10:25:14 UTC 2024] Your cert key is in: /var/lib/acme/.acme.sh/demo.skobba.net_ecc/demo.skobba.net.key
[Mon Apr 29 10:25:14 UTC 2024] The intermediate CA cert is in: /var/lib/acme/.acme.sh/demo.skobba.net_ecc/ca.cer
[Mon Apr 29 10:25:14 UTC 2024] And the full chain certs is there: /var/lib/acme/.acme.sh/demo.skobba.net_ecc/fullchain.cer
[Mon Apr 29 10:25:15 UTC 2024] _on_issue_success
[Mon Apr 29 10:25:15 UTC 2024] '' does not contain 'dns'

Wrong Result:
[Mon Apr 29 09:55:57 UTC 2024] Using CA: https://acme-staging-v02.api.letsencrypt.org/directory
[Mon Apr 29 09:55:57 UTC 2024] Creating domain key
[Mon Apr 29 09:55:57 UTC 2024] The domain key is here: /var/lib/acme/.acme.sh/demo.skobba.net_ecc/demo.skobba.net.key
[Mon Apr 29 09:55:57 UTC 2024] Single domain='demo.skobba.net'
[Mon Apr 29 09:55:59 UTC 2024] Getting webroot for domain='demo.skobba.net'
[Mon Apr 29 09:55:59 UTC 2024] Verifying: demo.skobba.net
[Mon Apr 29 09:55:59 UTC 2024] Stateless mode for domain:demo.skobba.net
[Mon Apr 29 09:56:02 UTC 2024] Pending, The CA is processing your order, please just wait. (1/30)
[Mon Apr 29 09:56:05 UTC 2024] Invalid status, demo.skobba.net:Verify error detail:84.214.96.160: Fetching http://demo.skobba.net/.well-known/acme-challenge/5DaDeW05eod90hppIxW1YVlbGt_sFGDrJ0wnmM8xSDY: Connection refused
[Mon Apr 29 09:56:05 UTC 2024] Please add '--debug' or '--log' to check more details.
[Mon Apr 29 09:56:05 UTC 2024] See: https://github.com/acmesh-official/acme.sh/wiki/How-to-debug-acme.sh

```

## Certificate deployment
```sh
sudo -u acme -s
DEPLOY_HAPROXY_HOT_UPDATE=yes \
  DEPLOY_HAPROXY_STATS_SOCKET=/var/run/haproxy/admin.sock \
  DEPLOY_HAPROXY_PEM_PATH=/etc/haproxy/certs \
  acme.sh --deploy -d demo.skobba.net --deploy-hook haproxy
```

