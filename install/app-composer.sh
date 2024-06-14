sudo add-apt-repository -y ppa:ondrej/php

#sudo apt -y install php8.3 php8.3-{apcu,bcmath,bz2,cli,curl,intl,gd,igbinary,imagick,mbstring,msgpack,opcache,mysql,readline,redis,sqlite3,xml,xmlrpc,zip,fpm} \
#  php-gd php-gmp php-curl php-igbinary composer
sudo apt update
sudo apt install -y php-fpm php-cli php-xml php-mbstring php-intl

EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
    exit 1
fi

php composer-setup.php --quiet
RESULT=$?
rm composer-setup.php

mkdir -p ~/.local/bin
mv composer.phar ~/.local/bin/composer