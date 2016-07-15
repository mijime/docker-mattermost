FROM frolvlad/alpine-glibc:alpine-3.4

ENV ENTRYKIT_VER=0.4.0 \
    MATTERMOST_VER=3.2.0

RUN apk add --no-cache --virtual build-deps curl \
    && curl -sSL https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VER}/entrykit_${ENTRYKIT_VER}_Linux_x86_64.tgz \
      | tar -xzC /usr/local/bin \
    && /usr/local/bin/entrykit --symlink \
    && mkdir -p /opt \
    && curl -sSL https://releases.mattermost.com/${MATTERMOST_VER}/mattermost-team-${MATTERMOST_VER}-linux-amd64.tar.gz \
      | tar -xzC /opt \
    && apk del --purge build-deps

ADD assets/runtime /opt/mattermost/runtime

RUN addgroup mattermost -S \
    && adduser mattermost -S -G mattermost \
    && mkdir -p /etc/mattermost /var/log/mattermost /var/mattermost/data \
    && rm -r /opt/mattermost/logs /opt/mattermost/config \
    && ln -sf /etc/mattermost /opt/mattermost/config \
    && ln -sf /var/log/mattermost /opt/mattermost/logs \
    && ln -sf /var/mattermost/data /opt/mattermost/data \
    && chmod +x /opt/mattermost/runtime/entrypoint.sh \
    && chown root:mattermost -R /etc/mattermost \
    && chown mattermost: -R /var/mattermost/data /var/log/mattermost \
    && chmod o-rw -R /etc/mattermost /var/mattermost/data /var/log/mattermost

EXPOSE 80
VOLUME /etc/mattermost /var/log/mattermost /var/mattermost/data
WORKDIR /opt/mattermost

ENTRYPOINT [ \
  "/opt/mattermost/runtime/entrypoint.sh", \
  "switch", "sh=/bin/sh", "/bin/sh=/bin/sh", \
  "--", \
  "render", "/etc/mattermost/config.json", \
  "--", \
  "/opt/mattermost/bin/platform" ]
