#/bin/bash
set -e

version=latest
workspace=$(pwd)
arch=""
if [ "$(uname -m)" = "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" = "aarch64" ]; then
  arch=arm64
else
  echo "错误：不支持的架构 $(uname -m)"
  exit 1
fi

docker build --build-arg MODEL=Debug -t polaris-media:${version} .
docker tag polaris-media:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:${version}-linux-${arch}
docker tag polaris-media:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:latest-linux-${arch}