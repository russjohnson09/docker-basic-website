# cp ~/docker-basic-website/etc/nginx/sites-available/blog.ihateiceforfree.com /etc/nginx/sites-available/blog.ihateiceforfree.com
# ln -s /etc/nginx/sites-available/blog.ihateiceforfree.com /etc/nginx/sites-enabled/
# systemctl restart nginx

server {
        listen 80;
        listen [::]:80;
        server_name  blog.ihateiceforfree.com;

        # pass to port 8000 running wordpress from docker-compose
        location / {
            proxy_pass      http://127.0.0.1:8000;
        }

}