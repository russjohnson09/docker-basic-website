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