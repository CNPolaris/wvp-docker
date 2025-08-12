#/bin/bash
set -e

version=latest
arch=""
if [ "$(uname -m)" = "x86_64" ]; then
  arch=amd64
elif [ "$(uname -m)" = "aarch64" ]; then
  arch=arm64
else
  echo "错误：不支持的架构 $(uname -m)"
  exit 1
fi

docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-redis:latest-linux-${arch}

# docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-mysql:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-mysql:${version}-linux-${arch}

# docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-media:${version}-linux-${arch}

# docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-wvp:${version}-linux-${arch}

# docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:latest-linux-${arch}
docker push docker.cnb.cool/polaris-tian/wvp-docker/polaris-nginx:${version}-linux-${arch}
