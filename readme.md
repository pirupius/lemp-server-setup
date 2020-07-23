## Included Software

* Ubuntu Server 18
* Git
* PHP 7.1
* Nginx
* MySQL
* Sqlite3
* Composer
* Node 6 (With Yarn, PM2, Bower, Grunt, and Gulp)
* Redis
* Memcached
* Beanstalkd

## Installation


Setup Laravel Environment(PHP 7.1, Redis, etc)
$ wget https://raw.githubusercontent.com/jorgie-o/laravel-server-provision/master/provision.sh | bash

Set up the site to a domain or IP address as well as give folder permissions to www-data
$ wget https://raw.githubusercontent.com/jorgie-o/laravel-server-provision/master/laravel-virtual-site.sh | bash

================

1). Pull down the script

My Ubuntu 16.04

```
wget https://raw.githubusercontent.com/TrustFinity/server-init/master/deploy-16.sh -O deploy.sh
chmod +x deploy.sh
```

Ubuntu 14.04

```
wget https://raw.githubusercontent.com/TrustFinity/server-init/master/deploy.sh
chmod +x deploy.sh
```


2). Config MySQL password

`vi deploy.sh` edit your password:

```
# Configure
MYSQL_ROOT_PASSWORD="{{--Your Password--}}"
MYSQL_NORMAL_USER="estuser"
MYSQL_NORMAL_USER_PASSWORD="{{--Your Password--}}"
```

3). Start install

Run the shell script:

```
./deploy.sh
```

> Note: You must run as `root`.

It will finish installation with this message:

```
--
--
It's Done.
Mysql Root Password: xxxxxx
Mysql Normal User: xxxxxxx
Mysql Normal User Password: xxxxxx
--
--
```

## After installation

### 1. Web root permission

Nginx using `deploi` user, in order to have a correct permission, you should change the owner of the directory:

```
cd /data/www/{YOU PROJECT FOLDER NAME}
chown deploi:deploi -R ./
```

### 2. Add a site

Here is a Nginx config file template for Laravel Project, you should put it at `/etc/nginx/sites-enabled` folder.

For example `/etc/nginx/sites-enabled/phphub.org`:

```
server {
    listen 80;
    server_name {{---YOU-DOMAIN-NAME---}};
    root "{{---YOU-PROJECT-FOLDER---}}";

    index index.html index.htm index.php;

    charset utf-8;

    location / {
        try_files $uri $uri/ /index.php?$query_string;
    }

    location = /favicon.ico { access_log off; log_not_found off; }
    location = /robots.txt  { access_log off; log_not_found off; }

    access_log /data/log/nginx/{{---YOU-PROJECT-NAME---}}-access.log;
    error_log  /data/log/nginx/{{---YOU-PROJECT-NAME---}}-error.log error;

    sendfile off;

    client_max_body_size 100m;

    include fastcgi.conf;

    location ~ /\.ht {
        deny all;
    }

    location ~ \.php$ {
        fastcgi_pass   127.0.0.1:9000;
        fastcgi_index  index.php;
        fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
        include        fastcgi_params;
    }
}
```

Restart Nginx when you done:

```
service nginx restart
```





======================================



LNMP installation script for Ubuntu 16.04, and set up domestic mirror acceleration.

Make sure that all commands are executed as root, if not root login account, you need to do sudo -H -sto root account and then download and install.

Software list
Git
PHP 7.3
Nginx
MySQL
Sqlite3
Composer
Chapter 8
Yarn
Redis
Complaint
Memcached
Optional software list
The following software needs to manually execute the installation script:

Elasticsearch:, the ./16.04/install_elasticsearch.shdefault is 6.x, if you want to install 7.x then execute./16.04/install_elasticsearch.sh 7
installation steps
wget -qO- https://raw.githubusercontent.com/summerblue/laravel-ubuntu-init/master/download.sh - | bash
This script will install the script downloaded to the user's Home directory of the current laravel-ubuntu-initdirectory and automatically execute the installation script will output Mysql root account password on the screen after the installation is complete, properly preserved.

If it is not the root account, it will not be installed automatically. You need to switch to the root account and execute it ./16.04/install.sh.

Daily use
1. New Nginx site
./16.04/nginx_add_site.sh
You will be prompted to enter the site name (only English, numbers, -and _), domain name (multiple domain names are separated by spaces), after confirmation is correct, it will create the corresponding Nginx configuration and restart Nginx.

2. Add Mysql user and database
./16.04/mysql_add_user.sh
You will be prompted to enter the root password. If you make a mistake, you cannot continue. Enter the Mysql user name to be created and confirm whether you need to create a database corresponding to the user name.

After the creation is completed, the password of the new user will be output to the screen, please save it properly.

3. Execute the command as www-data
This provides a program sudowwwof alias, when it is necessary to www-datathe execution command user identity (e.g. git clone 项目, php artisan config:cacheetc.), can be added directly in front of the command sudowww, at both ends of the original command with an apostrophe, such as:

sudowww 'php artisan config:cache'







