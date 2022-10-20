#!/bin/bash

sudo apt update
sudo apt install apache2
sudo apt install docker.io
sudo snap install core; sudo snap refresh core
sudo snap install --classic certbot
sudo ln -s /snap/bin/certbot /usr/bin/certbot
sudo certbot --apache

docker run -d --name mariadb -p 3306:3306 -e MARIADB_ROOT_PASSWORD=my-secret-pw mariadb
docker run -d -p 8080:80 --link mariadb:mariadb --name wp1 wordpress
docker run -d -p 8081:80 --link mariadb:mariadb --name wp2 wordpress

docker exec -ti mariadb mysql -u -pmy-secret-pw  -e "CREATE DATABASE wp1;" 
docker exec -ti mariadb mysql -u -pmy-secret-pw  -e "CREATE DATABASE wp2;" 
docker exec -ti mariadb mysql -u -pmy-secret-pw  -e "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY 'wp1' WITH GRANT OPTION;" 

# docker exec -ti mariadb /bin/bash

sudo a2enmod headers
