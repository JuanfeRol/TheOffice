FROM debian:bullseye

ENV DEBIAN_FRONTEND=noninteractive

# Instalar herramientas necesarias
RUN apt update && apt install -y \
    cron \
    cifs-utils \
    tar \
    nano \
    net-tools \
    iputils-ping \
    curl

# Crear directorios
RUN mkdir -p /mnt/samba_backup /backup

# Copiar script y crontab
COPY backupSamba.sh /usr/local/bin/backupsamba.sh
COPY crontab.txt /etc/cron.d/samba-backup
copy serverWeb.sh /usr/local/bin/serverWeb.sh

# Permisos
RUN chmod +x /usr/local/bin/backupsamba.sh && \
    chmod 0644 /etc/cron.d/samba-backup && \
    chmod 755 /usr/local/bin/serverWeb.sh


    

# Registrar el cronjob
RUN crontab /etc/cron.d/samba-backup

# Crear archivo de credenciales (puedes cambiar esto por una variable o volumen si quieres)
RUN echo "username=smbuser" > /root/.smbcredentials && \
    echo "password=smbpass" >> /root/.smbcredentials && \
    chmod 600 /root/.smbcredentials

# Comando por defecto: inicia cron y deja el contenedor activo
CMD cron && tail -f /dev/null

CMD ["/usr/local/bin/serverWeb.sh"]
