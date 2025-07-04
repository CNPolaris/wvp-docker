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

docker build -t polaris-wvp:${version} .
docker tag polaris-wvp:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:${version}
docker tag polaris-wvp:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:${arch}
docker tag polaris-wvp:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:latest