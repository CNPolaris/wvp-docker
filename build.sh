#/bin/bash
set -e

version=2.7.3
workspace=$(pwd)

# echo "物理机编译前端"
if [ -d "$workspace/wvp-GB28181-pro" ]; then
  cd $workspace/wvp-GB28181-pro && git pull
else
  git clone -b 2.7.3 https://github.com/648540858/wvp-GB28181-pro.git  
fi

# cd $workspace/wvp-GB28181-pro/web_src && \
#     npm install && \
#     npm run build 
    
# mkdir -p $workspace/nginx/dist
# cp -r $workspace/wvp-GB28181-pro/src/main/resources/static/* $workspace/nginx/dist

# echo "复制初始化数据库"
mkdir -p $workspace/mysql/sql
cp -r $workspace/wvp-GB28181-pro/数据库/${version}/* $workspace/mysql/sql/

# echo "构建ZLM容器"
# cd $workspace/media/
# chmod +x ./build.sh && ./build.sh

echo "构建数据库容器"
cd $workspace/mysql/
chmod +x ./build.sh && ./build.sh

echo "构建Redis容器"
cd $workspace/redis/
chmod +x ./build.sh && ./build.sh

# echo "构建WVP容器"
# cd $workspace/wvp/
# chmod +x ./build.sh && ./build.sh

# echo "构建Nginx容器"
# cd $workspace/nginx/
# chmod +x ./build.sh && ./build.sh
