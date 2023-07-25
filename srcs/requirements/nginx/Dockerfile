# FROM debian:bullseye

# RUN apt-get update
# RUN apt-get install -y nginx \
# 	openssl curl  

# # RUN mkdir /etc/nginx/ssl

# RUN openssl req -x509 -nodes -days 365 -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42sp/CN=lpaulo-d" \
# 	-newkey rsa:2048 -keyout /etc/ssl/lpaulo-d.key -out /etc/ssl/lpaulo-d.crt;
# COPY ./conf/nginx.conf /etc/nginx/conf.d

# # RUN mkdir -p /var/www/html/wordpress
# RUN mkdir -p /run/nginx

# EXPOSE 443

# CMD ["nginx", "-g", "daemon off;"]

FROM debian:bullseye

RUN apt-get update -y \
	&& apt-get install -y nginx openssl curl \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Gerar certificados SSL autogerados (self-signed)
RUN openssl req -x509 -nodes -days 3650 -subj "/C=BR/ST=Sao Paulo/L=Sao Paulo/O=42sp/CN=localhost" \
	-newkey rsa:2048 -keyout /etc/ssl/nginx.key -out /etc/ssl/nginx.crt;

# Copiar o arquivo de configuração personalizado para o Nginx
COPY ./conf/nginx.conf /etc/nginx/nginx.conf.template
COPY ./conf/nginx.conf /etc/nginx/sites-available/nginx.conf

# Criar link simbólico para ativar o site
RUN unlink /etc/nginx/sites-enabled/default

# Remover o link simbólico default do Nginx
RUN ln -s /etc/nginx/sites-available/nginx.conf /etc/nginx/sites-enabled/




# Expor as portas 80 e 443
# EXPOSE 80
EXPOSE 443

# Iniciar o serviço do Nginx em primeiro plano
CMD ["nginx", "-g", "daemon off;"]
