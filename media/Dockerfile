FROM ubuntu:22.04 AS build

ENV DEBIAN_FRONTEND=noninteractive

ARG MODEL
#shell,rtmp,rtsp,rtsps,http,rtp
EXPOSE 10935/tcp
EXPOSE 5540/tcp
EXPOSE 6080/tcp
EXPOSE 10000/udp
EXPOSE 10000/tcp
EXPOSE 8000/udp
EXPOSE 8000/tcp
EXPOSE 9000/udp

# ADD sources.list /etc/apt/sources.list
RUN sed -Ei "s@(security|ports|archive).ubuntu.com@mirrors.cloud.tencent.com@g" /etc/apt/sources.list
RUN apt-get update && \
         DEBIAN_FRONTEND="noninteractive" \
         apt-get install -y --no-install-recommends \
         build-essential \
         cmake \
         git \
         curl \
         wget \
         ca-certificates \
         tzdata \
         gcc \
         g++ \
         gdb && \
         apt-get autoremove -y && \
         apt-get clean -y && \
         rm -rf /var/lib/apt/lists/*
         
RUN mkdir -p /opt/media
RUN mkdir -p /opt/media/assist
WORKDIR /opt/media
RUN git clone --depth 1 https://github.com/ZLMediaKit/ZLMediaKit.git && \
    cd ZLMediaKit && git submodule update --init
WORKDIR /opt/media/ZLMediaKit

# 3rdpart init
WORKDIR /opt/media/ZLMediaKit/3rdpart
RUN wget https://polaris-tian-generic.pkg.coding.net/qt/dependencies/openssl-1.1.1k.tar.gz?version=latest -O openssl-1.1.1k.tar.gz && \
    tar -xvzf openssl-1.1.1k.tar.gz && \
    cd openssl-1.1.1k && ./config shared --openssldir=/usr/local/openssl --prefix=/usr/local/openssl && \
    make -j $(nproc) && make install && \
    echo "/usr/local/lib64/" >> /etc/ld.so.conf && \
    echo "/usr/local/openssl/lib" >> /etc/ld.so.conf && \
    ldconfig && \
    ln -s /usr/local/openssl/bin/openssl  /usr/local/bin/openssl

RUN mkdir -p build release/linux/${MODEL}/

WORKDIR /opt/media/ZLMediaKit/build
RUN cmake -DCMAKE_BUILD_TYPE=${MODEL} -DENABLE_WEBRTC=true -DENABLE_FFMPEG=true -DENABLE_TESTS=false -DENABLE_API=false .. && \
    make -j $(nproc)
COPY config.ini /opt/media/ZLMediaKit/release/linux/${MODEL}/

FROM ubuntu:22.04
ARG MODEL

RUN sed -Ei "s@(security|ports|archive).ubuntu.com@mirrors.cloud.tencent.com@g" /etc/apt/sources.list
RUN apt-get update && \
         DEBIAN_FRONTEND="noninteractive" \
         apt-get install -y --no-install-recommends \
         vim \
         wget \
         ca-certificates \
         tzdata \
         curl \
         libssl-dev \
         ffmpeg \
         gcc \
         g++ \
         gdb && \
         apt-get autoremove -y && \
         apt-get clean -y && \
    rm -rf /var/lib/apt/lists/*

ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime \
        && echo $TZ > /etc/timezone && \
        mkdir -p /opt/media/bin/www

WORKDIR /opt/media/bin/
COPY --from=build /opt/media/ZLMediaKit/release/linux/${MODEL}/MediaServer /opt/media/ZLMediaKit/default.pem /opt/media/bin/
COPY --from=build /opt/media/ZLMediaKit/release/linux/${MODEL}/config.ini /opt/media/conf/
COPY --from=build /opt/media/ZLMediaKit/www/ /opt/media/bin/www/
ENV PATH /opt/media/bin:$PATH
CMD ["./MediaServer","-s", "default.pem", "-c", "../conf/config.ini", "-l","0"]