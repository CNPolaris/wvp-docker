#/bin/bash
set -e

version=2.7.3
docker login -u polaris-1745395195527 -p 32115838d22d034cb3d9e9fcdcc607c5b5d55b90 polaris-tian-docker.pkg.coding.net

docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:latest
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:latest
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-redis:latest
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:latest
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:latest
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:${version}
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:${version}
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-redis:${version}
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:${version}
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:${version}