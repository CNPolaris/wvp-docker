# FROM mysql:5.7

# #设置免密登录
# ENV MYSQL_ALLOW_EMPTY_PASSWORD yes

# COPY setup.sh /mysql/setup.sh
# COPY wvp.sql /mysql/wvp.sql
# COPY privileges.sql /mysql/privileges.sql

# CMD ["sh", "/mysql/setup.sh"]
FROM mysql:8.0.32

ADD ./db/*.sql /docker-entrypoint-initdb.d/