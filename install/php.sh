sudo add-apt-repository -y ppa:ondrej/php

sudo apt -y install php8.3 php8.3-{apcu,bcmath,bz2,cli,curl,intl,gd,igbinary,imagick,mbstring,msgpack,opcache,mysql,readline,redis,sqlite3,xml,xmlrpc,zip,fpm} \
  php-gd php-gmp php-curl php-igbinary composer