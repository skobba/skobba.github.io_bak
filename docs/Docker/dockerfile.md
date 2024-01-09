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
