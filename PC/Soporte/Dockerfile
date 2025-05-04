FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    echo "postfix postfix/main_mailer_type string 'Local only'" | debconf-set-selections && \
    apt install -y ldap-utils mailutils cron net-tools iputils-ping cups netcat

COPY startup.sh /usr/local/bin/startup.sh
COPY cupsd.conf /etc/cups/cupsd.conf  
    
RUN chmod +x /usr/local/bin/startup.sh
    
EXPOSE 631
    
CMD ["/usr/local/bin/startup.sh"]
