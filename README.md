## ssl-proxy
A dockerized nginx ssl proxy to use for local development.

## Installation

```
$ docker pull neochrome/ssl-proxy
```

## Usage
If your application is running and is listening on port 3000:

```
$ docker run -it --rm --name ssl-proxy -p 443:443 neochrome/ssl-proxy
```

A nginx proxy will be started on port 443 (https) with an upstream
pointing at `172.17.42.1:3000` (standard docker bridge).

In order to change the upstream, pass a new environment variable `APP_URL`:

```
$ docker run -it --name ssl-proxy -e APP_URL=192.168.0.1:1234 -p 443:443 neochrome/ssl-proxy
```

## Certificates
Upon start a new certificate will be generated (prompting for the CN).

If desired, an existing certificate/key pair may be used:

```
$ docker run -it --rm --name ssl-proxy -p 443:443 -v $PWD/existing.key:/app.key -v $PWD/exsiting.crt:/app.crt neochrome/ssl-proxy
```
