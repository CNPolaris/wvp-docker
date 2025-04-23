#/bin/bash
set -e

version=2.7.3

docker build -t ylcx-mysql:${version} .
docker tag ylcx-mysql:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-mysql:${version}
docker tag ylcx-mysql:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-mysql:latest