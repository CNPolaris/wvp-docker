FROM nginx:alpine

RUN apk add --no-cache bash

ARG TZ=Asia/Shanghai
RUN \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories && \
    apk update && \
    apk add tzdata
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
  echo '${TZ}' > /etc/timezone

RUN mkdir /opt/dist
COPY ./dist /opt/dist

CMD ["nginx","-g","daemon off;"]

