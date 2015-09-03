FROM alpine:latest

RUN apk --update add nginx openssl &&\
	rm -rf /var/cache/apk*

COPY run.sh /
COPY nginx.conf /etc/nginx/

EXPOSE 80 443

CMD /run.sh
