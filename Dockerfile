FROM quay.io/ukhomeofficedigital/centos-base:latest
WORKDIR /etc/nginx

COPY nginx.repo /etc/yum.repos.d/nginx.repo

RUN yum install -y  yum-utils \
    openssl \
    nginx && \
    yum clean all


# This takes a while so best to do it during build
RUN openssl dhparam -out /etc/nginx/dhparam.pem 2048

RUN usermod -u 1000 nginx && \
    chown -R nginx:nginx /etc/nginx /var/log/nginx

COPY bin/run.sh /run.sh
COPY conf.d /etc/nginx/conf.d


COPY nginx.conf .
ENV NGINX_CONFIG_FILE=/etc/nginx/nginx.conf

RUN mkdir static
ADD ./static/ static


USER 1000
ENTRYPOINT ["/run.sh"]
