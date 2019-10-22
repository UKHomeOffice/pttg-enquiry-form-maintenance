FROM quay.io/ukhomeofficedigital/nginx:v0.2.7
WORKDIR /etc/nginx

COPY nginx.conf .
ENV NGINX_CONFIG_FILE=/etc/nginx/nginx.conf

RUN mkdir static
ADD ./static/ static
