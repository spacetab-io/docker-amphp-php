FROM spacetabio/amphp-alpine:7.4-base-1.0.0

RUN apk add --update --no-cache libgcc libstdc++ libx11 glib libxrender libxext libintl \
    ttf-dejavu ttf-droid ttf-freefont ttf-liberation ttf-ubuntu-font-family wkhtmltopdf \
    font-screen-cyrillic font-misc-cyrillic \
    && cp /usr/bin/wkhtmltopdf /usr/local/bin/wkhtmltopdf

