FROM mysql:8.0.32

# 系统时区
ARG TZ=Asia/Shanghai
# 设置时区
RUN ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
  echo '${TZ}' > /etc/timezone
# 复制配置
COPY ./conf/my.cnf /etc/mysql/conf.d/my.cnf

# 复制初始化脚本
COPY ./db/privileges.sql /tmp
COPY ./db/wvp.sql /tmp
COPY ./sql/初始化-mysql-2.7.4.sql /tmp
COPY ./sql/更新-mysql-2.7.4.sql /tmp
# 设置初始化脚本
RUN cat /tmp/privileges.sql >> /tmp/init.sql && \
    cat /tmp/wvp.sql >> /tmp/init.sql && \
    cat /tmp/初始化-mysql-2.7.4.sql >> /tmp/init.sql && \
    cat /tmp/更新-mysql-2.7.4.sql >> /tmp/init.sql && \
    cp /tmp/init.sql /docker-entrypoint-initdb.d