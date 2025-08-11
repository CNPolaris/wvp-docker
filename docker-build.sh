#/bin/bash
set -e

version=latest
db=2.7.4
workspace=$(pwd)

echo "[1/10]同步最新代码"
if [ -d "$workspace/wvp-GB28181-pro" ]; then
  cd $workspace/wvp-GB28181-pro && git pull
else
  git clone https://github.com/648540858/wvp-GB28181-pro.git
fi

if [ -d "$workspace/wvp-pro-assist" ]; then
  cd $workspace/wvp-pro-assist && git pull
else
  git clone https://github.com/648540858/wvp-pro-assist.git
fi

# echo "[2/10]编译前端代码"
# cd $workspace/wvp-GB28181-pro/web && \
#     npm config set registry https://mirrors.cloud.tencent.com/npm/ && \
#     npm install && \
#     npm run build:prod

# echo "[3/10]编译后端代码"
# cd $workspace/wvp-GB28181-pro && \
#     mvn clean package -Dmaven.test.skip=true

# cd $workspace/wvp-pro-assist && \
#     mvn clean package -Dmaven.test.skip=true

# echo "[4/10]拷贝前后端静态资源"
# mkdir -p $workspace/nginx/dist
# cp -r $workspace/wvp-GB28181-pro/src/main/resources/static/* $workspace/nginx/dist
# cp $workspace/wvp-GB28181-pro/target/*.jar $workspace/wvp/wvp/wvp.jar
# cp $workspace/wvp-pro-assist/target/*.jar $workspace/wvp/assist/assist.jar

# echo "[5/10]构建Nginx容器"
# cd $workspace/nginx/
# chmod +x ./build.sh && ./build.sh

# echo "[6/10]构建数据库容器"
# mkdir -p $workspace/mysql/sql
# cp -r $workspace/wvp-GB28181-pro/数据库/$db/* $workspace/mysql/sql/
# cd $workspace/mysql/
# chmod +x ./build.sh && ./build.sh

# echo "[7/10]构建WVP容器"
# cd $workspace/wvp
# chmod +x ./build.sh && ./build.sh

# echo "[8/10]构建ZLM容器"
# cd $workspace/media/
# chmod +x ./build.sh && ./build.sh

echo "[9/10]构建Redis容器"
cd $workspace/redis/
chmod +x ./build.sh && ./build.sh

echo "[10/10]推送镜像"
# chmod +x ./push.sh && ./push.sh
