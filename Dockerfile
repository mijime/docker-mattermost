FROM alpine:3.5

ENV ENTRYKIT_VER=0.4.0 \
    MATTERMOST_VER=3.7.2 \
    GOPATH=/opt/go

RUN apk add --no-cache ca-certificates \
    && apk add --no-cache --virtual=.build-dependencies \
      go git mercurial curl make gcc musl-dev \
    && curl -sSL https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VER}/entrykit_${ENTRYKIT_VER}_Linux_x86_64.tgz \
      | tar -xzC /usr/local/bin \
    && /usr/local/bin/entrykit --symlink \
    && mkdir -p /opt \
    && curl -sSL https://releases.mattermost.com/${MATTERMOST_VER}/mattermost-team-${MATTERMOST_VER}-linux-amd64.tar.gz \
      | tar -xzC /opt \
    && go get github.com/tools/godep \
    && git clone --depth 1 --branch v${MATTERMOST_VER} \
      https://github.com/mattermost/platform \
      ${GOPATH}/src/github.com/mattermost/platform \
    && cd ${GOPATH}/src/github.com/mattermost/platform \
    && sed -i.org 's/sudo //g' Makefile \
    && make build-linux BUILD_NUMBER=${MATTERMOST_VER} \
    && cp ${GOPATH}/bin/platform /opt/mattermost/bin/platform \
    && cd - \
    && rm -rf \
      ${GOPATH} \
      /usr/lib/go/pkg \
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
