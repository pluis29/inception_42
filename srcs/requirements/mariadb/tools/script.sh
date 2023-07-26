#!/bin/bash

# Script de inicialização do MariaDB no contêiner Docker

# Inicializa o diretório de dados do MySQL e cria as tabelas de sistema, se ainda não existirem
if [ ! -d "/var/lib/mysql/mysql" ]; then
    mysql_install_db --user=mysql --basedir=/usr --datadir=/var/lib/mysql
fi

# Inicia o serviço do MariaDB em background, executa o equivalente a mysql_secure_installation
# Configura o banco de dados e cria um usuário privilegiado

# Inicia o MariaDB em modo seguro (--datadir=/var/lib/mysql indica o diretório de dados)
# Aguarda 5 segundos para permitir que o MariaDB seja iniciado completamente
mysqld_safe --datadir=/var/lib/mysql &
sleep 5

# Executa comandos SQL para remover usuários e bancos de dados não utilizados e configurar o usuário root
mysql --user=root << _EOF_
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
DELETE FROM mysql.db WHERE Db='test' OR Db='test\\_%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$db_root_password';
FLUSH PRIVILEGES;
_EOF_

# Altera a propriedade e grupo do diretório de dados (/var/lib/mysql) para o usuário e grupo mysql
chown -R mysql:mysql /var/lib/mysql

# Executa comandos SQL para criar o banco de dados e conceder privilégios ao usuário definidos no arquivo .env
mysql --user=root --password=$db_root_password << _EOF_
CREATE DATABASE IF NOT EXISTS $db_database;
GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' IDENTIFIED BY '$db_root_password';
GRANT ALL PRIVILEGES ON $db_database.* TO '$db_user'@'%' IDENTIFIED BY '$db_password' WITH GRANT OPTION;
FLUSH PRIVILEGES;
_EOF_

# Necessário parar o serviço antes de executar o comando CMD (mysqld) do Dockerfile
mysqladmin -uroot -p$db_root_password shutdown

exec "$@"