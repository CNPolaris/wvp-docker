FROM nginx:latest

EXPOSE 8080

RUN mkdir -p /opt/ylcx/www
WORKDIR /opt/ylcx/www
COPY ./html/dist /opt/ylcx/www

WORKDIR /etc/nginx/
COPY ./conf/nginx.conf.template /etc/nginx/templates/nginx.conf.template

ENV LANG C.UTF-8
CMD ["nginx","-g","daemon off;"]

