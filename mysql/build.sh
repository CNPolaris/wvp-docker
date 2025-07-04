#/bin/bash
set -e

version=2.7.4

if [ "$(uname -m)" == "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" == "aarch64" ]; then
  arch=arm64
else
  arch=amd64
fi

docker build -t polaris-mysql:${version} .
rm -rf ./sql

docker tag polaris-mysql:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:${version}
docker tag polaris-mysql:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:${arch}
docker tag polaris-mysql:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:latest