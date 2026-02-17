# cp ~/docker-basic-website/etc/nginx/sites-available/test.ihateiceforfree.com /etc/nginx/sites-available/test.ihateiceforfree.com
# ln -s /etc/nginx/sites-available/test.ihateiceforfree.com /etc/nginx/sites-enabled/
# systemctl restart nginx

# curl test.ihateiceforfree.com
server {
        server_name  test.ihateiceforfree.com;

        root /var/www/foo/html;
        index index.html index.htm index.nginx-debian.html;

        location /non_proxy {
                try_files $uri $uri/ =404;
        }

        location / {
            #app1.example.com
            proxy_pass      http://127.0.0.1:80;
        }

    listen [::]:443 ssl ipv6only=on; # managed by Certbot
    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/test.ihateiceforfree.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/test.ihateiceforfree.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}
server {
    if ($host = test.ihateiceforfree.com) {
        return 301 https://$host$request_uri;
    } # managed by Certbot


        listen 80;
        listen [::]:80;
        server_name  test.ihateiceforfree.com;
    return 404; # managed by Certbot


}