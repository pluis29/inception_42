# Use a imagem base do Debian Bullseye
FROM debian:bullseye

# Atualizar os repositórios e instalar os pacotes necessários
RUN apt-get update \
	&& apt-get install -y \
	nginx \
	openssl

# Copiar os arquivos de configuração para o container
COPY ./conf/nginx.conf /etc/nginx/sites-available/default

# Expor a porta 443 (para o TLS/SSL)
EXPOSE 443

# Comandos para gerar as chaves TLS e iniciar o servidor Nginx
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/certs/nginx-selfsigned.crt -subj "/C=US/ST=State/L=City/O=Organization/CN=lpaulo-d.42.fr"
CMD ["nginx", "-g", "daemon off;"]
