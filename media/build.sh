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

docker build --build-arg MODEL=Release  -t polaris-media:${version} .
docker tag polaris-media:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:${version}-linux-${arch}
docker tag polaris-media:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:latest-linux-${arch}