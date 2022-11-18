FROM node:18.7.0
RUN apt-get update && apt-get install -y iputils-ping telnet vim git wget
WORKDIR /app
#COPY package.json /app
#
RUN npm install -g npm pm2 @angular/cli
COPY . /app
WORKDIR /app/frontend
RUN npm install
EXPOSE 8082
CMD ng serve