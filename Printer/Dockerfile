FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    apt install -y cups cups-bsd cups-client avahi-daemon net-tools iputils-ping curl && \
    useradd -m printer

COPY startup.sh /usr/local/bin/startup.sh
COPY cupsd.conf /etc/cups/cupsd.conf  

RUN chmod +x /usr/local/bin/startup.sh

EXPOSE 631

CMD ["/usr/local/bin/startup.sh"]
