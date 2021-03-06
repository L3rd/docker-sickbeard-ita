FROM phusion/baseimage:0.9.11
MAINTAINER L3rd
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty universe multiverse"
RUN add-apt-repository "deb http://us.archive.ubuntu.com/ubuntu/ trusty-updates universe multiverse"
RUN apt-get update -q

# Install Dependencies
RUN apt-get install -qy python python-cheetah ca-certificates wget unrar

# Install SickBeard 637a214 (2014-11-14)
RUN mkdir /opt/sickbeard-ita
RUN wget https://github.com/gborri/Sick-Beard/tarball/3a432f43970400891c065c34685920eafaf4ac5a -O /tmp/gborri-Sick-Beard-build-484-5265-g3a432f4.tar.gz
RUN tar -C /opt/sickbeard-ita -xvf /tmp/gborri-Sick-Beard-build-484-5265-g3a432f4.tar.gz --strip-components 1
RUN chown nobody:users /opt/sickbeard-ita

EXPOSE 8081

# SickBeard Configuration
VOLUME /config

# Downloads directory
VOLUME /downloads

# TV directory
VOLUME /tv

# Add edge.sh to execute during container startup
RUN mkdir -p /etc/my_init.d
ADD edge.sh /etc/my_init.d/edge.sh
RUN chmod +x /etc/my_init.d/edge.sh

# Add Sickbeard to runit
RUN mkdir /etc/service/sickbeard-ita
ADD sickbeard-ita.sh /etc/service/sickbeard-ita/run
RUN chmod +x /etc/service/sickbeard-ita/run
