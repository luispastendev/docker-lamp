FROM debian:stable-slim

RUN apt update

RUN apt install apache2 -y && \
    apt install vim -y     && \
    apt install ssh -y

WORKDIR /var/www/html/

COPY src/index.html .
COPY entrypoint.sh /var/www

ENV FOO=BAR

ENTRYPOINT [ "/var/www/entrypoint.sh" ]
