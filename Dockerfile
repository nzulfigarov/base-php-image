FROM php:8.1.20-fpm-alpine3.18

WORKDIR /var/www/html/

### PHP ###
RUN curl -sSLf -o /usr/local/bin/install-php-extensions https://github.com/mlocati/docker-php-extension-installer/releases/download/2.1.68/install-php-extensions && \
    chmod +x /usr/local/bin/install-php-extensions

RUN apk add -Uuv --no-cache git

RUN apk add -Uuv --no-cache aom-libs libbz2 libpng \
    freetype icu-data-full libstdc++ icu-libs libxau libmd \
    libbsd libxdmcp libxcb libx11 libxext libexpat fontconfig \
    lcms2 libltdl imagemagick-libs libxrender pixman cairo \
    libffi libintl libblkid libmount pcre2 glib dbus-libs \
    avahi-libs gmp nettle p11-kit libtasn1 gnutls cups-libs \
    jbig2dec libjpeg-turbo libwebp zstd-libs tiff ghostscript \
    libde265 numactl x265-libs libheif libhwy libjxl libgomp \
    libraw cairo-gobject pkgconf shared-mime-info gdk-pixbuf \
    libxft fribidi graphite2 harfbuzz pango librsvg imagemagick \
    libdav1d libavif libice libuuid libsm libxt libxpm libgpg-error \
    libgcrypt libxslt libzip libpq libecpg yaml postgresql-libs tzdata git \
    nginx supervisor && \
    rm /etc/supervisord.conf && \
    rm -rf /etc/nginx/*

RUN install-php-extensions  \
    bz2 calendar exif gd gettext pgsql shmop sockets sysvmsg sysvsem sysvshm xsl mysqli pdo_mysql pdo_pgsql zip yaml imagick intl redis opcache pcntl bcmath soap

