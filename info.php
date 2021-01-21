<?php
    phpinfo();
?>

server {
    listen 80;
    server_name test.cloudwaferlabs.com.ng www.test.cloudwaferlabs.com.ng;

    root    /var/www/html/test.cloudwaferlabs.com.ng;
    index index.php index.html index.htm;

    #charset koi8-r;
    access_log /var/log/nginx/access_log;
    error_log  /var/log/nginx/error_log   error;

   location / {
            try_files $uri $uri/ /index.php?$query_string;
    }

   # pass the PHP scripts to FastCGI server listening on 127.0.0.1:9000
    location ~ \.php$ {

            root    /var/www/html/test.cloudwaferlabs.com.ng;
            fastcgi_pass   127.0.0.1:9001;    #set port for php56-php-fpm to listen on
        fastcgi_index  index.php;
            fastcgi_param  SCRIPT_FILENAME  $document_root$fastcgi_script_name;
            include         fastcgi_params;
            include /etc/nginx/fastcgi_params;

    }

