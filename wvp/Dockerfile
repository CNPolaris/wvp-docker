FROM ubuntu:20.04 AS build
ENV DEBIAN_FRONTEND=noninteractive

ARG TARGETPLATFORM

EXPOSE 18978/tcp
EXPOSE 8116/tcp
EXPOSE 8116/udp
EXPOSE 8080/tcp
EXPOSE 18081

EXPOSE 30000-30500
EXPOSE 50502-50506 

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
         DEBIAN_FRONTEND="noninteractive" \
         apt-get install -y --no-install-recommends \
         wget \
         git \
         openjdk-17-jdk \
         ffmpeg && \
         apt-get autoremove -y && \
         apt-get clean -y && \
         rm -rf /var/lib/apt/lists/*

# 录像存储位置
RUN mkdir -p /opt/media/assist

RUN mkdir -p /opt/wvp
WORKDIR /opt/wvp

COPY wvp/wvp.jar /opt/wvp/wvp.jar
RUN chmod +rx /opt/wvp/wvp.jar

RUN mkdir -p /opt/assist
COPY ./assist/run.sh /opt/assist
COPY ./assist/assist.jar /opt/assist/assist.jar

RUN chmod +rx /opt/assist/assist.jar
RUN chmod +rx /opt/assist/run.sh
RUN /opt/assist/run.sh start

WORKDIR /opt/wvp
ENTRYPOINT ["java", "-Xms512m", "-Xmx1024m", "-XX:+HeapDumpOnOutOfMemoryError", "-XX:HeapDumpPath=/opt/wvp/", "-jar", "/opt/wvp/wvp.jar", "--spring.config.location=/opt/wvp/conf/application.yml"]