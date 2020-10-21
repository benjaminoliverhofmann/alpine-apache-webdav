FROM alpine:edge

LABEL maintainer="hb@beohof.de"

RUN apk add --no-cache apache2-webdav apache2-utils

RUN mkdir -p /www/wedbdav  && \
chown -R apache:apache /www && \
chmod 750 /www

COPY docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80