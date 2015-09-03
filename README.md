## ssl-proxy
A dockerized nginx ssl proxy to use for local development.

## Installation

```
$ docker pull neochrome/ssl-proxy
```

## Usage
If your application is running and is listening on port 3000:

```
$ docker run -it --name ssl-proxy -p 8080:80 -p 4343:443 neochrome/ssl-proxy
```

A nginx proxy will be started on ports 8080 (http) and 4343 (https) with an upstream
pointing at `172.17.42.1:3000` (standard docker bridge).

In order to change the upstream, pass a new environment variable `APP_URL`:

```
$ docker run -it --name ssl-proxy -e APP_URL=192.168.0.1:1234 -p 8080:80 -p 4343:443 ssl-proxy
```
