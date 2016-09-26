FROM mhart/alpine-node:6.0
MAINTAINER MikaXII <mikaxii@recalbox.com>

ENV GHOST_VERSION=
ENV GHOST_IP=127.0.0.1
ENV GHOST_PORT=2368
ENV GHOST_DB=mysql
ENV GHOST_HOST=mysql_host
ENV GHOST_DB_USER=ghost
ENV GHOST_DB_PASS=somepassword
ENV GHOST_DB_NAME=ghost_db

# Keep while package is alpha
RUN apk add --no-cache git 
RUN npm install -g   https://github.com/MikaXII/Ghost-CLI #ghost-cli lodash.foreach


RUN adduser ghost -h /home/ghost -s /bin/bash -D
USER ghost
WORKDIR /home/ghost

#Only for test
RUN ghost install -d blog --ip ${GHOST_IP} --port ${GHOST_PORT} --db ${GHOST_DB} \
        --dbhost ${GHOST_HOST} --dbuser ${GHOST_DB_USER} --dbpass ${GHOST_DB_PASS} \
        --dbname ${GHOST_DB_NAME} ${GHOST_VERSION}
