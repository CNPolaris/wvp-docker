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

docker build -t polaris-wvp:${version} .
docker tag polaris-wvp:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:${version}
docker tag polaris-wvp:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:${arch}
docker tag polaris-wvp:${version} docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:latest