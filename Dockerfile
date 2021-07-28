FROM wordpress:5.8.0-fpm-alpine

# set timezone
RUN apk add --no-cache tzdata
RUN cp /usr/share/zoneinfo/Europe/Berlin /etc/localtime \
    && echo "Europe/Berlin" >  /etc/timezone
RUN apk del tzdata

# add WP CLI
COPY --from=wordpress:cli-2.5.0 /usr/local/bin/wp /usr/local/bin/wp

