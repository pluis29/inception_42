FROM debian:buster

ARG MYSQL_DATABASE
ARG MYSQL_ROOT_PASSWORD
ARG MYSQL_USER
ARG MYSQL_PASSWORD

RUN apt-get update
RUN apt-get install -y mariadb-server \
    mariadb-client

RUN mkdir -p /var/run/mysqld \
    && chown -R mysql:mysql /var/run/mysqld \
    && chmod 777 /var/run/mysqld

COPY ./conf/mariadb.sql /

RUN sed -i 's/bind-address/#bind-address/' /etc/mysql/mariadb.conf.d/50-server.cnf && \
	service mysql start && \
	sleep 5s && \
	echo "GRANT ALL ON *.* TO root@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD' WITH GRANT OPTION; FLUSH PRIVILEGES" | mysql && \
	mysqladmin -u root password "$MYSQL_ROOT_PASSWORD" && \
	mysql -e "CREATE DATABASE $MYSQL_DATABASE;" && \
	mysql -e "CREATE USER '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" && \
	mysql -e "GRANT ALL PRIVILEGES ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%';" && \
	mysql -e "FLUSH PRIVILEGES;" && \
	mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < mariadb.sql ;

EXPOSE 3306

CMD ["mysqld", "--bind-address=0.0.0.0"]