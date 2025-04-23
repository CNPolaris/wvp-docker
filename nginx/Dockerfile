
FROM node:14 as build-stage

RUN cd /home && \
    git clone https://gitee.com/pan648540858/wvp-GB28181-pro.git

RUN cd /home/wvp-GB28181-pro/web_src && \
    npm install && \
    npm run build && \
    cp /home/wvp-GB28181-pro/src/main/resources/staitci/ /opt/ylcx/www

FROM nginx:latest
EXPOSE 8080

WORKDIR /etc/nginx/
COPY ./conf/nginx.conf.template /etc/nginx/templates/nginx.conf.template

ENV LANG C.UTF-8
CMD ["nginx","-g","daemon off;"]

