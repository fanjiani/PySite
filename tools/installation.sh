#!/bin/sh

cd /var/www/

rm -r -f PySite
git clone http://github.com/revoll/PySite.git
chown -R www-data:www-data PySite
mv PySite/.pysite_env.example PySite/.pysite_env

mkdir -p /etc/nginx
mkdir -p /etc/uwsgi/vassals
rm -f /etc/nginx/sites-available/pysite_nginx.conf
rm -f /etc/nginx/sites-enabled/pysite_nginx.conf
rm -f /etc/uwsgi/vassals/pysite_uwsgi.ini
cp PySite/tools/pysite_nginx.conf /etc/nginx/sites-available/pysite_nginx.conf
cp PySite/tools/pysite_uwsgi.ini /etc/uwsgi/vassals/pysite_uwsgi.ini
ln -s /etc/nginx/sites-available/pysite_nginx.conf /etc/nginx/sites-enabled/pysite_nginx.conf

nginx -s reload