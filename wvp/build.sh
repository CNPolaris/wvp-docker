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

docker build -t polaris-wvp:${version} .
docker tag polaris-wvp:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:${version}-linux-${arch}
docker tag polaris-wvp:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:latest-linux-${arch}