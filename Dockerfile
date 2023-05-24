FROM registry.access.redhat.com/ubi9

# This uses /demo/ as main web directory
RUN yum -y install nginx && yum clean all

RUN rm -rf /etc/nginx/conf.d/* && \
    rm -rf /etc/nginx/default.d/*

RUN groupadd -r -g 101 aks && \
    useradd -r -g aks -u 101 -d /nonexistent -s /bin/false aks

RUN mkdir -p /var/lib/nginx/tmp/client_body && \
    mkdir -p /var/log/nginx && \
    touch /var/run/nginx.pid && \
    chown -R aks:aks /usr/share/nginx /var/log/nginx /var/lib/nginx /var/run/nginx.pid && \
    chmod -R 755 /usr/share/nginx /var/log/nginx /var/lib/nginx /var/run/nginx.pid

RUN mkdir -p /usr/share/nginx/html && \
    chown -R aks:aks /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html


COPY nginx.conf /etc/nginx/nginx.conf


COPY build/ /usr/share/nginx/html


USER aks

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
