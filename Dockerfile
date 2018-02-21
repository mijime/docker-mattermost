FROM alpine:3.5

ARG ENTRYKIT_VER=${ENTRYKIT_VER:-0.4.0}
ARG MATTERMOST_VER=${MATTERMOST_VER:-4.7.1}
ARG MATTERMOST_EDITION=${MATTERMOST_EDITION:-team}

RUN mkdir -p /lib64 && ln -sfb /lib/libc.musl-x86_64.so.1 /lib64/ld-linux-x86-64.so.2
RUN apk add --no-cache ca-certificates \
    && apk add --no-cache --virtual=.build-dependencies \
      curl \
    && curl -sSL https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VER}/entrykit_${ENTRYKIT_VER}_Linux_x86_64.tgz \
      | tar -xzC /usr/local/bin \
    && /usr/local/bin/entrykit --symlink \
    && mkdir -p /opt \
    && curl -sSL https://releases.mattermost.com/${MATTERMOST_VER}/mattermost-${MATTERMOST_EDITION}-${MATTERMOST_VER}-linux-amd64.tar.gz \
      | tar -xzC /opt \
    && apk del --purge .build-dependencies \
    && addgroup mattermost -S \
    && adduser mattermost -S -G mattermost \
    && chown root:mattermost -R /opt/mattermost \
    && mkdir -p /etc/mattermost /var/log/mattermost /var/mattermost/data \
    && rm -r /opt/mattermost/logs /opt/mattermost/config \
    && ln -sf /etc/mattermost /opt/mattermost/config \
    && ln -sf /var/log/mattermost /opt/mattermost/logs \
    && ln -sf /var/mattermost/data /opt/mattermost/data \
    && chown root:mattermost -R /etc/mattermost \
    && chown mattermost: -R /var/mattermost/data /var/log/mattermost \
    && chmod o-rw -R /etc/mattermost /var/mattermost/data /var/log/mattermost

ADD assets/runtime /opt/mattermost/runtime
RUN chmod +x /opt/mattermost/runtime/entrypoint.sh

EXPOSE 80 8067
VOLUME /etc/mattermost /var/log/mattermost /var/mattermost/data
WORKDIR /opt/mattermost

ENTRYPOINT [ \
  "/opt/mattermost/runtime/entrypoint.sh", \
  "switch", "sh=/bin/sh", "/bin/sh=/bin/sh", \
  "--", \
  "render", "/etc/mattermost/config.json", \
  "--", \
  "/opt/mattermost/bin/platform" ]
