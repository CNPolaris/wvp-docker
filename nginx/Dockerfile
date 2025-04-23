
FROM node:14 as build-stage

ENV LANG C.UTF-8
EXPOSE 8080

RUN cd /home && \
    git clone https://gitee.com/pan648540858/wvp-GB28181-pro.git

RUN mkdir /opt/dist
RUN cd /home/wvp-GB28181-pro/web_src && \
    npm install && \
    npm run build && \
    cp -r /home/wvp-GB28181-pro/src/main/resources/static/* /usr/share/nginx/html

FROM nginx:alpine
ARG TZ=Asia/Shanghai
RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add tzdata
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
  echo '${TZ}' > /etc/timezone

RUN rm -rf /etc/nginx/conf.d/*  
COPY ./conf/nginx.conf /etc/nginx/conf.d

CMD ["nginx","-g","daemon off;"]

