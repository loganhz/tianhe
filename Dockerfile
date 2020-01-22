FROM nginx:alpine
RUN rm -rf /etc/nginx/nginx.conf
ADD nginx.conf.template  /etc/nginx/nginx.conf.template
COPY index.html /usr/share/nginx/html/
EXPOSE 80
CMD ["/bin/sh", "-c", "envsubst '$SERVER_URL' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf && exec nginx -g 'daemon off;'"]
