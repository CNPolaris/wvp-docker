#/bin/bash
set -e

version=2.7.3

docker build -t ylcx-wvp:${version} .
docker tag ylcx-wvp:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-wvp:${version}
docker tag ylcx-wvp:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-wvp:latest