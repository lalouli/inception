FROM alpine:3.17

ARG Data_name Data_User Data_pass

RUN apk update && apk add --no-cache mariadb mariadb-client

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
      echo 'bind-address=0.0.0.0'| tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/my.cnf.d/mariadb-server.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY requirements/mariadb/conf/db_script.sh .
RUN sh db_script.sh && rm db_script.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]
