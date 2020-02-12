FROM python:3.8-alpine3.11

ARG BUILD_DATE=unknown
ARG VERSION=dev
ARG VCS_REF=unknown

LABEL org.opencontainers.image.created="$BUILD_DATE" \
      org.opencontainers.image.ref.name="riotkit/collectd-aggregator" \
      org.opencontainers.image.title="Collectd" \
      org.opencontainers.image.description="Collectd server that aggregates results of other collectd instances and passes to InfluxDB" \
      org.opencontainers.image.documentation="https://riotkit.org" \
      org.opencontainers.image.source="https://github.com/riotkit-org/collectd-aggregator" \
      org.opencontainers.image.url="https://github.com/riotkit-org/collectd-aggregator" \
      org.opencontainers.image.revision="$VCS_REF" \
      org.opencontainers.image.authors="RiotKit technical collective" \
      org.riotkit.filerepository.version="$VERSION"

ENV FORWARD_ADDRESS="influxdb" \
    FORWARD_PORT="25826" \
    FORWARD_USER= \
    FORWARD_PASSWORD=

COPY container-files/bin/* /bin/
COPY container-files/etc/collectd/* /etc/collectd/
COPY container-files/etc/supervisor/supervisord.conf /etc/supervisor/supervisord.conf

RUN pip install --no-cache-dir j2cli \
    && apk add --update collectd collectd-network bash rsyslog supervisor \
    && chmod +x /bin/entrypoint.sh

RUN addgroup -g 1000 -S riotkit \
    && adduser -u 1000 -S riotkit -G riotkit \
    && chown riotkit:riotkit -R /etc/collectd/ \
    && mkdir -p /var/log/supervisor/

USER root
ENTRYPOINT ["/bin/entrypoint.sh"]
