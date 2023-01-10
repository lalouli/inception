FROM alpine:3.17
ARG PHP_VERSION=81 DB_NAME DB_USER DB_PASS
RUN apk update && apk upgrade && apk add --no-cache \
    php${PHP_VERSION} php${PHP_VERSION}-fpm php${PHP_VERSION}-mysqli php${PHP_VERSION}-curl php${PHP_VERSION}-redis \
    wget unzip && \
    sed -i "s|listen = 127.0.0.1:9000|listen = 9000|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.owner = nobody|listen.owner = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    sed -i "s|;listen.group = nobody|listen.group = nobody|g" \
      /etc/php81/php-fpm.d/www.conf && \
    rm -f /var/cache/apk/*
WORKDIR /var/www
RUN wget https://wordpress.org/latest.zip && \
    unzip latest.zip && \
    cp -rf wordpress/* . && \
    rm -rf wordpress latest.zip
COPY ./requirements/wordpress/conf/wp-script.sh .
RUN sh wp-script.sh && rm wp-script.sh && \
    chmod -R 0777 wp-content/
CMD ["/usr/sbin/php-fpm81", "-F"]