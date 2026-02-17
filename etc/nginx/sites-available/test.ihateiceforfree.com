
# cp ~/docker-basic-website/etc/nginx/sites-available/test.ihateiceforfree.com /etc/nginx/sites-available/test.ihateiceforfree.com
# ln -s /etc/nginx/sites-available/test.ihateiceforfree.com /etc/nginx/sites-enabled/
# systemctl restart nginx

# curl test.ihateiceforfree.com
server {
        listen 80;
        listen [::]:80;
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
}