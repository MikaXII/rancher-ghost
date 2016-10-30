FROM ghost:0.11.2
MAINTAINER MikaXII <mikaxii@recalbox.com>

ENV GHOST_URL="http://localhost"
ENV DB_HOST="127.0.0.1"
ENV DB_USER="user"
ENV DB_PASSWD="passwd"
ENV DB_NAME="db_name"
ENV IP_LISTEN="0.0.0.0"
ENV PORT_LISTEN="2368"

RUN apt-get update && apt-get install -y \
        gettext \
 && rm -rf /var/lib/apt/lists/*

ADD ./config.js.tmpl ./
ADD ./start.sh /bin/

CMD ["start.sh"]
