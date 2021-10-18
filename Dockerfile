FROM debian:bullseye-slim

RUN apt-get update \
  && apt-get install -y isc-dhcp-server \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /etc/dhcp/*

COPY entrypoint.sh /

VOLUME /etc/dhcp/

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
