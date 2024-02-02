# Reverse Proxy
Ref.: [https://docs.opnsense.org/manual/reverse_proxy.html](https://docs.opnsense.org/manual/reverse_proxy.html)

## Why should a reverse proxy be used?
The packet filter itself cannot decide what should be done in application protocols. For such an inspection you can use deep packet inspection or a reverse proxy.

In addition, a reverse proxy can implement protocol specific access control lists as well as other checks to protect the application behind. Such checks are malware, spam, web attack detection and so on.

___Warning___
_Reverse proxies support you to prevent common attacks to your web application by bots but will never provide a 100% success rate in detection of bad traffic. Especially a targeted attack will very likely be not detected because a lot of effort has been taken to prevent detection. Do not use a reverse proxy as a replacement / excuse for not fixing the main problems like known vulnerabilities in libraries, outdated software, or vulnerabilities in your own code by updating / removing them or by changing your own code._


