#/bin/bash
set -e

version=2.7.3

rm ./dist/static/js/config.js
cp ./config.js ./dist/static/js/

docker build -t ylcx-nginx:${version} .
docker tag ylcx-nginx:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-nginx:${version}
docker tag ylcx-nginx:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/ylcx-nginx:latest