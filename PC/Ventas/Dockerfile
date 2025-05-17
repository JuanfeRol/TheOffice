FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && \
    echo "postfix postfix/main_mailer_type string 'Local only'" | debconf-set-selections && \
    apt install -y ldap-utils mailutils cron net-tools iputils-ping cups netcat curl neomutt ca-certificates nano dnsutils iproute2 telnet libsasl2-modules smbclient

COPY startup.sh /usr/local/bin/startup.sh
COPY cupsd.conf /etc/cups/cupsd.conf  
COPY addPrinters.sh /home
COPY confEmail.sh /home
COPY mount_samba.sh /usr/local/bin/mount_samba.sh

RUN chmod +x /usr/local/bin/mount_samba.sh 
RUN chmod +x /usr/local/bin/startup.sh
RUN chmod +x /home/addPrinters.sh
RUN chmod 755 /home/confEmail.sh

    
EXPOSE 631
    
CMD ["/usr/local/bin/startup.sh"]
