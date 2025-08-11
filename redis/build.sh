#/bin/bash
set -e

version=latest
if [ "$(uname -m)" == "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" == "aarch64" ]; then
  arch=arm64
fi
docker build -t polaris-redis:${version} .
docker tag polaris-redis:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-redis:latest-linux-${arch}