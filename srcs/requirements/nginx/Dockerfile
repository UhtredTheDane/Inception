FROM debian:bullseye

RUN apt update -y && apt upgrade -y && apt install nginx -y && apt install openssl -y 
RUN mkdir -p /etc/nginx/ssl
RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout /etc/nginx/ssl/inception.key -subj "/C=FR/ST=IDF/L=Paris/O=42/CN=agengemb.42.fr/UID=agengemb"
RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html
COPY conf/nginx.conf /etc/nginx/nginx.conf 
ENTRYPOINT ["nginx"]
CMD ["-g", "daemon off;"]
