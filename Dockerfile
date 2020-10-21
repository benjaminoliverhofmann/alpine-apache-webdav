FROM alpine:latest

LABEL maintainer="hb@beohof.de"

RUN apk add --no-cache apache2-webdav apache2-utils apr-util-dbm_db

ADD dav.conf /etc/apache2/conf.d/
ADD docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
EXPOSE 80