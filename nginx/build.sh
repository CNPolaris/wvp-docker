#/bin/bash
set -e

version=latest
arch=""
if [ "$(uname -m)" = "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" = "aarch64" ]; then
  arch=arm64
else
  echo "错误：不支持的架构 $(uname -m)"
  exit 1
fi

rm ./dist/static/js/config.js
cp ./config.js ./dist/static/js/

docker build -t polaris-nginx:${version} .
docker tag polaris-nginx:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:${version}
docker tag polaris-nginx:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:${version}-linux-${arch}
docker tag polaris-nginx:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:latest-linux-${arch}