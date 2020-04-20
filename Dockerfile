FROM alpine:3.11

RUN set -eux; \
  apk --update --no-cache add rsync openssh-client;

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
