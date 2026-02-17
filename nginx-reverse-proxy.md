https://medium.com/@dinusai05/setting-up-a-secure-reverse-proxy-with-https-using-docker-compose-nginx-and-certbot-lets-encrypt-cfd012c53ca0


I think I'm just going to install nginx on the host machine.



# ssh
ssh root@143.198.15.145
ssh root@test.ihateiceforfree.com


cat /etc/os-release | grep VERSION
VERSION="24.04.3 LTS (Noble Numbat)"


https://www.digitalocean.com/community/tutorials/how-to-install-nginx-on-ubuntu-22-04

apt install nginx -y
nginx -v
dpkg -l | grep nginx


curl -4 icanhazip.com

curl http://143.198.15.145


http://test.ihateiceforfree.com/

ls /etc/nginx/sites-enabled/ -al
total 8
drwxr-xr-x 2 root root 4096 Feb 17 05:01 .
drwxr-xr-x 8 root root 4096 Feb 17 05:07 ..
lrwxrwxrwx 1 root root   34 Feb 17 05:01 default -> /etc/nginx/sites-available/default


 ln -s /etc/nginx/sites-available/your_domain /etc/nginx/sites-enabled/


## letsencrypt


apt install certbot python3-certbot-nginx


certbot --nginx -d test.ihateiceforfree.com


Successfully deployed certificate for test.ihateiceforfree.com to /etc/nginx/sites-enabled/test.ihateiceforfree.com
Congratulations! You have successfully enabled HTTPS on https://test.ihateiceforfree.com


