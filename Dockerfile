FROM alpine:latest

RUN apk update && \
  apk add --no-cache ca-certificates \
  openssh-client \
  bash

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]