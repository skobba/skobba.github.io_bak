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
  server server1 10.10.3.238:80

backend be_demo.skobba.net
  server server1 10.10.1.235:80


```

Test
```
service haproxy restart
curl 127.0.0.1:80
```

## Domain forward
```sh
frontend fe_demo.skobba.net
  bind *:80
  acl ACL_demo.skobba.net hdr(host) -i demo.skobba.net
  use_backend be_demo.skobba.net if ACL_demo.skobba.net


frontend fe_test.skobba.net
  bind *:80
  acl ACL_test.skobba.net hdr(host) -i test.skobba.net
  use_backend be_test.skobba.net if ACL_test.skobba.net


backend be_demo.skobba.net
  server server1 10.10.1.235:80

backend be_test.skobba.net
  server server1 10.10.3.238:80
```
