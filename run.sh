#!/usr/bin/env bash
docker run -it --rm --name ssl-proxy -p 8080:80 -p 4343:443 ssl-proxy
