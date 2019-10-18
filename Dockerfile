FROM quay.io/ukhomeofficedigital/nginx:v0.2.7

WORKDIR /etc/nginx
COPY nginx.conf .
ENV NGINX_CONFIG_FILE=/etc/nginx/nginx.conf

RUN mkdir static
ADD ./static/ static

# This takes a while so best to do it during build
USER root
RUN apk update && apk add openssl shadow
RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

# As certs from cfssl-sidekick belong to user '1000', we need to make nginx's UID '1000'
RUN /usr/sbin/usermod -u 1000 nginx
RUN chown 1000 /var/tmp/nginx

USER 1000
ENTRYPOINT ["/run.sh"]
