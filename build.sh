#!/usr/bin/env bash
version=$(git describe --tags)
echo building version ${version:-0}
docker build -t ssl-proxy:${version:-0} src/
docker tag -f ssl-proxy:${version:-0} ssl-proxy:latest
