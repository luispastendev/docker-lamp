FROM debian:stable-slim

RUN apt update

RUN apt install apache2 -y && \
    apt install vim -y && \
    apt install ssh -y

RUN useradd -m www -s /bin/bash && \
    mkdir /home/www/.ssh

WORKDIR /var/www/html/

COPY src/index.html .
COPY entrypoint.sh /var/www
COPY keys /keys

ENV FOO=BAR

EXPOSE 22 80

ENTRYPOINT [ "/var/www/entrypoint.sh" ]
