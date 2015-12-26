FROM ubuntu:14.04
MAINTAINER Qian Hong <qhong@codeweavers.com>
RUN dpkg --add-architecture i386
RUN apt-get update && apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:wine/wine-builds
RUN apt-get update && apt-get install -y --install-recommends wine-staging  winehq-staging wine-staging-i386 wget xvfb 
COPY msys2-env /etc/
COPY msys2-shell /usr/bin/
COPY msys2-init /usr/bin/
RUN msys2-init
