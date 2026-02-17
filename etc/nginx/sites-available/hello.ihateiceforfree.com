
# ssh root@test.ihateiceforfree.com
# cp ~/docker-basic-website/etc/nginx/sites-available/hello.ihateiceforfree.com /etc/nginx/sites-available/hello.ihateiceforfree.com
# ln -s /etc/nginx/sites-available/hello.ihateiceforfree.com /etc/nginx/sites-enabled/
# systemctl restart nginx

server {
        listen 80;
        listen [::]:80;
        server_name  hello.ihateiceforfree.com;

        root /root/docker-basic-website/static/hello;
        index index.html index.htm index.nginx-debian.html;

        location / {
                try_files $uri $uri/ =404;
        }

}