FROM php:7.4-cli-alpine AS build

RUN apk add --update --no-cache pcre icu postgresql yaml libuv \
    && apk add --update --no-cache --virtual build-dependencies \
       autoconf g++ libtool pcre make icu-dev postgresql-dev \
	   postgresql-libs libsasl db yaml-dev libuv-dev \
	&& docker-php-ext-configure opcache --enable-opcache \
	&& docker-php-ext-install -j $(nproc) pcntl opcache intl \
    && pecl install yaml \
    && docker-php-ext-enable yaml \
    && rm -rf ../php-uv \
    && pecl install channel://pecl.php.net/uv-0.2.4 \
    && docker-php-ext-enable uv \
    && pecl install xdebug \
    && docker-php-ext-enable xdebug \
	&& apk del build-dependencies

ENV PHP_MEMORY_LIMIT=-1
ENV PHP_MAX_EXECUTION_TIME=0
ENV PHP_MAX_INPUT_TIME=60
ENV PHP_ERROR_REPORTING="E_ALL & ~E_DEPRECATED & ~E_STRICT"
ENV PHP_DISPLAY_ERRORS=Off
ENV PHP_POST_MAX_SIZE=512M
ENV PHP_UPLOAD_MAX_FILESIZE=512M
ENV PHP_MAX_FILE_UPLOADS=20
ENV PHP_DEFAULT_MIMETYPE=application/json
ENV PHP_SESSION_STRICT_MODE=1
ENV PHP_SESSION_COOKIE_SECURE=1
ENV PHP_EXPOSE_PHP=Off
ENV PHP_DATE_TIMEZONE=UTC
ENV PHP_SHORT_OPEN_TAG=Off

ENV PHP_FFI_ENABLE=false
ENV PHP_FFI_PRELOAD=''
ENV PHP_OPCACHE_ENABLE=1
ENV PHP_OPCACHE_ENABLE_CLI=1
ENV PHP_OPCACHE_MEMORY_CONSUMPTION=512
ENV PHP_OPCACHE_INTERNED_STRINGS_BUFFER=16
ENV PHP_OPCACHE_MAX_ACCELERATED_FILES_AUTO=true
ENV PHP_OPCACHE_MAX_ACCELERATED_FILES=50000
ENV PHP_OPCACHE_REVALIDATE_FREQ=0
ENV PHP_OPCACHE_ENABLE_FILE_OVERRIDE=1
ENV PHP_OPCACHE_FILE_CACHE_ONLY=1

COPY --from=roquie/smalte:latest-alpine /app/smalte /usr/local/bin/smalte
COPY base/7.4/php.ini.tmpl /usr/local/etc/php/php.ini.tmpl
COPY configure.sh /

EXPOSE 8080
WORKDIR /app

ENTRYPOINT ["/configure.sh"]
CMD ["echo", "Docker CMD instruction should be overridden to run your code."]
