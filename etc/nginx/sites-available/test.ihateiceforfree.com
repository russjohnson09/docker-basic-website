
# cp ~/docker-basic-website/etc/nginx/sites-available/test.ihateiceforfree.com /etc/nginx/sites-available/test.ihateiceforfree.com
# ln -s /etc/nginx/sites-available/test.ihateiceforfree.com /etc/nginx/sites-enabled/
server {
        listen 80;
        listen [::]:80;
        server_name  test.ihateiceforfree.com;

        location / {
            #app1.example.com
        proxy_pass      http://127.0.0.1:80;
        }
}