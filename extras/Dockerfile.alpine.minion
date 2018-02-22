FROM alpine
MAINTAINER tim@cyface.com

RUN apk --no-cache update &&\
    apk --no-cache upgrade &&\
    apk --no-cache add git openssl salt-minion

RUN sed -i "s|#master: salt|master: salt-master|g" /etc/salt/minion

ENTRYPOINT ["salt-minion", "-l", "debug"]

