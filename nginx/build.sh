#/bin/bash
set -e

version=2.7.3

if [ "$(uname -m)" == "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" == "aarch64" ]; then
  arch=arm64
else
  arch=amd64
fi

rm ./dist/static/js/config.js
cp ./config.js ./dist/static/js/

docker build -t polaris-nginx:${version} .
docker tag polaris-nginx:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:${version}
docker tag polaris-nginx:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:${arch}
docker tag polaris-nginx:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:latest