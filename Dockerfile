FROM hypriot/rpi-node:0.12.0
MAINTAINER Marcel Steinbach <marcelst@me.com>

# Set correct environment variables.
ENV DEBIAN_FRONTEND noninteractive
# Set correct environment variables
ENV HOME /root

ADD . /build

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

RUN /build/prepare.sh 
RUN apt-get -q update && apt-get install -qy \
  supervisor \
  build-essential \
  libavahi-compat-libdnssd-dev \
  libasound2-dev \
  git
RUN npm install -g airsonos
RUN /build/cleanup.sh

# Use baseimage-docker's init system

EXPOSE 5000 5001 5002 5003 5004 5005 5006 5006 5007 5008 5009 5010 5011 5012 5013 5014 5015

CMD ["/usr/bin/supervisord"]
