FROM alpine:latest

RUN apk --update add nginx openssl &&\
	openssl req -x509 -nodes -days 36500 -newkey rsa:2048 -keyout /etc/nginx/nginx.key -out /etc/nginx/nginx.crt -subj "/C=XX/ST=XX/L=XX/O=XX/CN=XX" &&\
	apk del openssl &&\
	rm -rf /var/cache/apk*

COPY run.sh /
COPY nginx.conf /etc/nginx/

EXPOSE 80 443

CMD /run.sh
