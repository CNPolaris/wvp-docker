#/bin/bash
set -e

while getopts c:t:p:m:v:  opt
do
	case $opt in
		v)
			version=$OPTARG
			;;
		p)
			platform=$OPTARG
			;;
		?)
			echo "unkonwn"
			exit
			;;
       esac
done

docker buildx build --platform=$platform --build-arg MODEL=Release -t polaris-media:${version} .
docker tag polaris-media:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:${version}
docker tag polaris-media:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-media:latest