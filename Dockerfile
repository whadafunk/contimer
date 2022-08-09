# Dockerfile for building an ntp container based on chrony
# The goal of this container is to provide a reliable time referrence
# for the internal network

FROM alpine:latest
MAINTAINER gri.daniel@gmail.com
LABEL my_name="Daniel Grigore"
LABEL my_git="https://githubg.com/whadafunk"

RUN apk add chrony
COPY ./chrony.conf /etc/chrony/chrony.conf
COPY ./chrony.keys /etc/chrony/chrony.keys


EXPOSE 123/udp
EXPOSE 323/udp

ENTRYPOINT ["chronyd","-4","-d","-l","/var/log/chrony.log","-x"]


