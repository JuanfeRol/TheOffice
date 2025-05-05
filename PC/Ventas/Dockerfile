FROM workers:latest

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    echo "postfix postfix/main_mailer_type string 'Local only'" | debconf-set-selections && \
    apt install -y ldap-utils mailutils cron net-tools iputils-ping cups netcat curl neomutt ca-certificates nano dnsutils iproute2 telnet libsasl2-modules

COPY startup.sh /usr/local/bin/startup.sh
COPY cupsd.conf /etc/cups/cupsd.conf  
COPY addPrinters.sh /home
COPY confEmail.sh /home


    
RUN chmod +x /usr/local/bin/startup.sh
RUN chmod +x /home/addPrinters.sh
RUN chmod 755 /home/confEmail.sh

    
EXPOSE 631
    
CMD ["/usr/local/bin/startup.sh"]
