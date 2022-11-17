FROM nginx:latest

ARG AMBIENTE=${AMBIENTE} \
    USER=${USER} \
    CUSTOMUID=${CUSTOMUID} \
    CUSTOMGID=${CUSTOMGID} \
    APACHE= ${APACHE}

#COMANDOS PARA SETEAR EL PROPIETARIO DEL DIRECTORIO
RUN echo "USUARIO: ${USER}"    
RUN echo "CUSTOMUID: ${CUSTOMUID}"    
RUN echo "CUSTOMGID: ${CUSTOMGID}"
RUN echo "APACHE: ${APACHE}"

#INSTALAR LIBRERIAS UBUNTU
RUN apt-get update && apt-get install -y vim iputils-ping telnet vim
# USAR CONFIGURACION NGINX
COPY ./deploy/nginx /etc/nginx/conf.d