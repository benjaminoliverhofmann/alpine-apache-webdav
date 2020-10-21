#!/bin/sh

if [ -d "/www/webdav" ] 
then
    echo "webdav directory exists"
else
    echo "creating webdav directory"
    mkdir -p /www/webdav  && \
    chown -R apache:apache /www && \
    chmod -R 750 /www
fi

if [[ -z "${USERNAME}" || -z "${PASS}" ]]; then
    echo "Please supply username and password"
    exit 1
else
    htpasswd -cb /etc/apache2/webdav.password $USERNAME $PASS
    chown root:apache /etc/apache2/webdav.password
    chmod 640 /etc/apache2/webdav.password
    httpd -D FOREGROUND
fi