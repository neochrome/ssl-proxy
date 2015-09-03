#/bin/sh
mkdir -p /tmp/nginx/client-body /var/log/nginx
sed -i "s/<APP_URL>/${APP_URL:-172.17.42.1:3000}/" /etc/nginx/nginx.conf
nginx
echo 'Ready to serve'
tail -f /var/log/nginx/access.log
