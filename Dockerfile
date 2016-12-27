FROM resin/rpi-raspbian:wheezy
MAINTAINER Negash <i@negash.ru>

ENV DEBIAN_FRONTEND noninteractive
RUN apt-get update && apt-get install -y pptpd iptables

COPY ./etc/pptpd.conf /etc/pptpd.conf
COPY ./etc/ppp/pptpd-options /etc/ppp/pptpd-options

COPY entrypoint.sh /entrypoint.sh
RUN chmod 0700 /entrypoint.sh

ENV VPN_USER username
ENV VPN_PASS password

ENTRYPOINT ["/entrypoint.sh"]
CMD ["pptpd", "--fg", "--debug"]
