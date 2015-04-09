FROM hypriot/rpi-node:0.10.36
MAINTAINER Marcel Steinbach <marcelst@me.com>

ENV DEBIAN_FRONTEND noninteractive
ENV HOME /root

ADD . /build

RUN /usr/sbin/usermod -u 99 nobody && \
    /usr/sbin/usermod -g 100 nobody && \
    apt-get -q update && apt-get install -qy \
    supervisor \
    build-essential \
    libavahi-compat-libdnssd-dev \
    libasound2-dev \
    git && \
    mkdir -p /var/log/supervisor

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# airsonos @ 500be5ba2eb4625ba6da17baf122570142e63b17
RUN git clone https://github.com/justintime/airsonos && cd airsonos && npm install -g

EXPOSE 5000 5001 5002 5003 5004 5005 5006 5006 5007 5008 5009 5010 5011 5012 5013 5014 5015

CMD ["/usr/bin/supervisord"]
