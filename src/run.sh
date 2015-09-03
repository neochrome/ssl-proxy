#/bin/sh
set +x

# generate certificate if needed
if [ ! -e /app.crt ]; then
	echo 'Generating new certificate'
	echo -n 'Please enter a CN [localhost]: '
	read cn
	openssl	req \
		-x509 \
		-nodes \
		-days 36500 \
		-newkey rsa:2048 \
		-keyout /app.key \
		-out /app.crt \
		-subj "/C=XX/ST=XX/L=XX/O=XX/CN=${cn:-localhost}"
fi

mkdir -p /tmp/nginx/client-body /var/log/nginx
sed -i "s/<APP_URL>/${APP_URL:-172.17.42.1:3000}/" /etc/nginx/nginx.conf
nginx
echo 'Ready to serve'
tail -f /var/log/nginx/access.log
