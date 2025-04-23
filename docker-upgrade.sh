#/bin/bash
set -e

./build.sh
./push.sh

docker compose up -d --remove-orphans