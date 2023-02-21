#!/bin/bash

#Atualização dos pacotes do sistema
apt-get update

#Instalação do servidor web
apt-get install apache2 -y

#Configuração do firewall para permitir o tráfego HTTP
ufw allow 'Apache'

#Criação dos diretórios do site
mkdir -p /var/www/html/meusite.com/public_html
mkdir /var/www/html/meusite.com/logs

#Criação do arquivo index.html
echo "<html><body><h1>Meu site está funcionando!</h1></body></html>" > /var/www/html/meusite.com/public_html/index.html

#Definição das permissões dos diretórios
chown -R www-data:www-data /var/www/html/meusite.com/public_html
chmod -R 755 /var/www/html/meusite.com/public_html

#Reinicialização do servidor web
systemctl restart apache2
