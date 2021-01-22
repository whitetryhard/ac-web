FROM wyveo/nginx-php-fpm:php71
#Mis derechos :v
LABEL creator = "Gasper"
LABEL maintainer="Christian Cueva"

RUN apt-get update && apt-get install -y \
        net-tools \
        php7.1-soap
RUN apt-get update && apt-get install -y \
        libxml2-dev \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libmcrypt-dev 
RUN apt-get update && apt-get install -y \
        net-tools
# Limpiar Caché
RUN apt-get clean && rm -rf /var/lib/apt/lists/*
# Instalar Extenciones de php (No tocar el orden)


# En caso de que se caiga el server lo volverá a levantar.
HEALTHCHECK --interval=5s --timeout=15s --start-period=30s --retries=3 CMD netstat -lnpt | grep :80 || exit 1