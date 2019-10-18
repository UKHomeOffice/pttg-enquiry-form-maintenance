FROM quay.io/ukhomeofficedigital/nginx:v0.2.7

WORKDIR /etc/nginx
COPY nginx.conf .
ENV NGINX_CONFIG_FILE=/etc/nginx/nginx.conf

RUN mkdir static
ADD ./static/ static

# This takes a while so best to do it during build
USER root
RUN apk update && apk add openssl
RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

# 100 is nginx user
USER 100
