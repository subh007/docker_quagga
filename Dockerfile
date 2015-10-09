FROM ubuntu:14.04
MAINTAINER Subhash Kumar Singh

Run apt-get update

RUN apt-get install -y quagga
RUN apt-get install -y telnet
RUN apt-get install -y vim

ADD zebra.conf /etc/quagga/zebra.conf
ADD bgpd.conf /etc/quagga/bgpd.conf
ADD daemons /etc/quagga/daemons
ADD vtysh.conf /etc/quagga/vtysh.conf
ADD init_conf.sh /etc/quagga/init_conf.sh

RUN chmod +x /etc/quagga/init_conf.sh
CMD /etc/quagga/init_conf.sh ; /bin/bash
