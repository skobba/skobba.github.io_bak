# Dockerfile

## Debian with ssh enabeled
```
FROM debian:latest

RUN apt update
RUN apt -y install openssh-server sudo

RUN mkdir /var/run/sshd
RUN echo 'root:root1234' | chpasswd
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

EXPOSE 22

ENTRYPOINT /usr/sbin/sshd -D -o ListenAddress=0.0.0.0
```

## SSH on Linux Web App for Containers in Azure
Ref.: [https://azureossd.github.io/2022/04/27/2022-Enabling-SSH-on-Linux-Web-App-for-Containers/](https://azureossd.github.io/2022/04/27/2022-Enabling-SSH-on-Linux-Web-App-for-Containers/)

init_container.sh
```sh
#!/bin/sh
set -e

# Get env vars in the Dockerfile to show up in the SSH session
eval $(printenv | sed -n "s/^\([^=]\+\)=\(.*\)$/export \1=\2/p" | sed 's/"/\\\"/g' | sed '/=/s//="/' | sed 's/$/"/' >> /etc/profile)

echo "Starting SSH ..."
service ssh start

# Start Gunicorn
exec gunicorn -b 0.0.0.0:8000 app:app
```

sshd_config
```
Port 			2222
ListenAddress 		0.0.0.0
LoginGraceTime 		180
X11Forwarding 		yes
Ciphers aes128-cbc,3des-cbc,aes256-cbc,aes128-ctr,aes192-ctr,aes256-ctr
MACs hmac-sha1,hmac-sha1-96
StrictModes 		yes
SyslogFacility 		DAEMON
PasswordAuthentication 	yes
PermitEmptyPasswords 	no
PermitRootLogin 	yes
Subsystem sftp internal-sftp
```

Dockerfile
```docker
FROM python:3.10-slim
WORKDIR /app/

COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY ./ /app/

COPY sshd_config /etc/ssh/

# Start and enable SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd \
    && chmod u+x /app/init_container.sh

EXPOSE 8000 2222

ENTRYPOINT [ "/app/init_container.sh" ]
```
