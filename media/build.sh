#/bin/bash
set -e

version=2.7.3

docker build -t ylcx-media:${version} .
docker tag ylcx-media:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-media:${version}
docker tag ylcx-media:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-media:latest