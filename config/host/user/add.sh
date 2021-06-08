#!/bin/bash

sudo groupadd www -g 600
sudo adduser www -u 600 -g www

sudo groupadd mqadmin -g 602
sudo useradd mqadmin -u 602 -g mqadmin

sudo groupadd mysql -g 603
sudo useradd mysql -u 603 -g mysql
