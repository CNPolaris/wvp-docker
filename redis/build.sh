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

docker buildx build --platform=$platform -t polaris-redis:${version} . 
docker tag polaris-redis:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-redis:${version}
docker tag polaris-wvp:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-wvp:${platform}
docker tag polaris-redis:${version} polaris-tian-docker.pkg.coding.net/qt/polaris/polaris-redis:latest