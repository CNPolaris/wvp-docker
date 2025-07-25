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

docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-redis:latest-linux-${arch}

docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-mysql:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-mysql:${version}-linux-${arch}

docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:${version}-linux-${arch}

docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:${version}-linux-${arch}

docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:${version}-linux-${arch}
