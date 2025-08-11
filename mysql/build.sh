#/bin/bash
set -e

version=latest

if [ "$(uname -m)" == "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" == "aarch64" ]; then
  arch=arm64
fi

docker build -t polaris-mysql:${version} .
rm -rf ./sql

docker tag polaris-mysql:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-mysql:${version}-linux-${arch}
docker tag polaris-mysql:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-mysql:latest-linux-${arch}