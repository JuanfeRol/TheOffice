# Dockerfile: admin-red

FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y \
  iproute2 \
  net-tools \
  iputils-ping \
  curl \
  dnsutils \
  telnet \
  vim \
  nano \
  nmap \
  dovecot-core \
  bash \
  sudo \
  && apt clean

# Copiamos un script opcional para gestión de cuentas
COPY createEmailUser.sh /usr/local/bin/createEmailUser.sh
RUN chmod +x /usr/local/bin/createEmailUser.sh

CMD ["/bin/bash"]
