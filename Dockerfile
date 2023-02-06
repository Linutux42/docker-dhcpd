FROM debian:bullseye-slim

# hadolint ignore=DL3008
RUN apt-get update \
  && apt-get install -y isc-dhcp-server --no-install-recommends \
  && rm -rf /var/lib/apt/lists/* \
  && rm -rf /etc/dhcp/*

COPY entrypoint.sh /

VOLUME /etc/dhcp/

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]
