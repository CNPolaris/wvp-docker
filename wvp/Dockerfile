FROM ubuntu:20.04 AS build
ARG Platfrom=amd64
ARG JDK_NAME

EXPOSE 18978/tcp
EXPOSE 8116/tcp
EXPOSE 8116/udp
EXPOSE 8080/tcp

EXPOSE 30000 30001 30002 30003 30004 30005
EXPOSE 50502 50503 50504 50505 50506  

RUN apt-get update && \
         DEBIAN_FRONTEND="noninteractive" \
         apt-get install -y --no-install-recommends \
         wget \
         cmake \
         maven \
         git \
         ca-certificates \
         tzdata \
         curl \
         libpcre3 \
         libpcre3-dev \
         zlib1g-dev \
         openssl \
         libssl-dev \
         net-tools \
         iproute2 iputils-ping traceroute \
         gdb && \
         apt-get autoremove -y && \
         apt-get clean -y && \
         rm -rf /var/lib/apt/lists/*

# install jdk1.8
RUN mkdir -p /opt/download
WORKDIR /opt/download
RUN if [ "$Platfrom" = "arm64" ]; \
    then \
        wget https://polaris-tian-generic.pkg.coding.net/qt/autopliot/jdk-8u411-linux-aarch64.tar.gz?version=latest --no-check-certificate -O jdk-8.tar.gz && \
        tar -zxvf /opt/download/jdk-8.tar.gz -C /usr/local/ --transform 's/jdk1.8.0_411/java/' && \
        rm /opt/download/jdk-8.tar.gz; \
    else \
        wget https://polaris-tian-generic.pkg.coding.net/qt/autopliot/jdk-8u202-linux-x64.tar.gz?version=latest --no-check-certificate -O jdk-8.tar.gz && \
        tar -zxvf /opt/download/jdk-8.tar.gz -C /usr/local/ --transform 's/jdk1.8.0_202/java/' && \
        rm /opt/download/jdk-8.tar.gz; \
    fi

ENV JAVA_HOME /usr/local/java/
ENV JRE_HOME ${JAVA_HOME}/jre
ENV CLASSPATH .:${JAVA_HOME}/lib:${JRE_HOME}/lib 
ENV PATH ${JAVA_HOME}/bin:$PATH 

RUN java -version && javac -version

RUN mkdir -p /opt/wvp
WORKDIR /opt/wvp

WORKDIR /home
RUN cd /home && \
    git clone https://github.com/648540858/wvp-GB28181-pro.git

RUN cd /home/wvp-GB28181-pro && \
    mvn clean package -Dmaven.test.skip=true && \
    cp /home/wvp-GB28181-pro/target/*.jar /opt/wvp/wvp.jar
RUN chmod +rx /opt/wvp/wvp.jar
WORKDIR /opt/wvp
ENTRYPOINT ["java", "-Xms512m", "-Xmx1024m", "-XX:+HeapDumpOnOutOfMemoryError", "-XX:HeapDumpPath=/opt/wvp/", "-jar", "/opt/wvp/wvp.jar", "--spring.config.location=/opt/wvp/conf/application.yml"]