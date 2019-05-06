sudo add-apt-repository -y ppa:nginx/development
sudo add-apt-repository -y ppa:ondrej/php
sudo apt update

sudo apt upgrade

sudo apt-get install -y git tmux vim curl wget zip unzip htop nano


sudo apt install -y nginx

sudo apt purge apache2

sudo apt install -y php7.2-fpm php7.2-cli php7.2-gd php7.2-mysql php7.2-pgsql php7.2-imap php-memcached 
    php7.2-mbstring php7.2-xml php7.2-curl php7.2-bcmath php7.2-sqlite3 php7.2-xdebug



php -r "readfile('http://getcomposer.org/installer');" | sudo php -- -- install-dir=/usr/bin/ --filename=composer

sudo apt install composer


