FROM ubuntu:latest

RUN apt update && apt install -y ca-certificates openssh-client bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]