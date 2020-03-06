FROM ubuntu:latest

USER root

RUN apt-get update && apt-get install -y openssh-client

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]