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

# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:latest
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:latest
docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-redis:latest
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:latest
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:latest

# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:${version}
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:${version}
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:${version}
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:${version}

# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:${arch}
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-mysql:${arch}
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:${arch}
# docker push polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-nginx:${arch}