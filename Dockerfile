FROM alpine
MAINTAINER 15093565100@163.com
ARG FRP_VERSION = 0.33.0
RUN wget -O /tmp/frp_$FRP_VERSION_linux_amd64.tar.gz https://github.com/fatedier/frp/releases/download/v$FRP_VERSION/frp_$FRP_VERSION_linux_amd64.tar.gz && tar -xzf /tmp/frp_$FRP_VERSION_linux_amd64.tar.gz -C /tmp && mkdir /etc/frp/ && mv /tmp/frp_$FRP_VERSION_linux_amd64/frps_full.ini /etc/frp/frps.ini && mv /tmp/frp_$FRP_VERSION_linux_amd64/frps /usr/bin/frps && rm -rf /tmp/*
EXPOSE 7000 80 443
VOLUME /etc/frp/
ENTRYPOINT /usr/bin/frps -c /etc/frp/frps.ini 
    
