#/bin/bash
set -e

version=2.7.3

docker build -t ylcx-redis:${version} .
docker tag ylcx-redis:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-redis:${version}
docker tag ylcx-redis:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-redis:latest