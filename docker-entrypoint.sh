
#!/bin/sh

if [[ -z "${USER}" || -z "${PASS}" ]]; then
    echo "Please supply username and password"
    exit 1
else
    htpasswd -cb /etc/apache2/webdav.password $USER $PASS
    chown root:apache /etc/apache2/webdav.password
    chmod 640 /etc/apache2/webdav.password
    httpd -D FOREGROUND
fi