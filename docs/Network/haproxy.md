# HAProxy
* [haproxy.org](haproxy.org)
* [https://www.haproxy.com/blog/haproxy-and-let-s-encrypt](https://www.haproxy.com/blog/haproxy-and-let-s-encrypt)
* [https://markontech.com/posts/install-lets-encrypt-ssl-on-haproxy/](https://markontech.com/posts/install-lets-encrypt-ssl-on-haproxy/)

## HAProxy on alpine linux
```sh
apk update
apk add haproxy
```

Edit haproxy.cfg
```
defaults
  mode http
  timeout client 10s
  timeout connect 5s
  timeout server 10s 
  timeout http-request 10s

frontend myfrontend
  bind *:80
  default_backend myservers

backend myservers
  server server1 10.10.1.235:80
```

Test
```
service haproxy restart
curl 127.0.0.1:80
```

## Domain forward
```sh
frontend fe_demo_skobba_net
    bind *:80
    bind :443 ssl crt /etc/haproxy/certs/ strict-sni
    acl ACL_demo_skobba_net hdr(host) -i demo.skobba.net
    acl ACL_test_skobba_net hdr(host) -i test.skobba.net
    http-request return status 200 content-type text/plain lf-string "%[path,field(-1,/)].${ACCOUNT_THUMBPRINT}\n" if { path_beg '/.well-known/acme-challenge/' }
    use_backend be_demo_skobba_net if ACL_demo_skobba_net
    use_backend be_test_skobba_net if ACL_test_skobba_net

backend be_demo_skobba_net
    server server1 10.10.1.235:80

backend be_test_skobba_net
    server server1 10.10.3.238:80
```

## Logging
```sh
apk add rsyslog

global
    log /dev/log local0 debug

defaults
  log global
```
