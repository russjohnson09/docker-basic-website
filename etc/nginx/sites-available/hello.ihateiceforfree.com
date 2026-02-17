
# ssh root@test.ihateiceforfree.com
# cp ~/docker-basic-website/etc/nginx/sites-available/hello.ihateiceforfree.com /etc/nginx/sites-available/hello.ihateiceforfree.com
# ln -s /etc/nginx/sites-available/hello.ihateiceforfree.com /etc/nginx/sites-enabled/
# certbot --nginx -d hello.ihateiceforfree.com
# ln -s /root/docker-basic-website/static/hello /var/www/hello

# user www-data;
# systemctl restart nginx

 # root /root/docker-basic-website/static/hello;

 # chgrp www-data /root/docker-basic-website/static

# rm -rf /var/www/hello
# mkdir -p /var/www/hello
# cp -a /root/docker-basic-website/static/hello  /var/www/hello



server {
        server_name  hello.ihateiceforfree.com;

        root /var/www/hello;
        index index.html index.htm index.nginx-debian.html;

        location / {
                try_files $uri $uri/ =404;
        }


    listen [::]:443 ssl; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/hello.ihateiceforfree.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/hello.ihateiceforfree.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = hello.ihateiceforfree.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


        listen 80;
        listen [::]:80;
        server_name  hello.ihateiceforfree.com;
    return 404; # managed by Certbot


}