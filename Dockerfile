FROM alpine:3.3

ENV ENTRYKIT_VER=0.4.0 \
    MATTERMOST_VER=3.0.2 \
    GOPATH=/opt/go

RUN apk add --no-cache --virtual build-deps \
      go git mercurial nodejs make g++ \
    && curl -sSL https://github.com/progrium/entrykit/releases/download/v${ENTRYKIT_VER}/entrykit_${ENTRYKIT_VER}_Linux_x86_64.tgz \
      | tar -xzC /usr/local/bin \
    && /usr/local/bin/entrykit --symlink \
    && go get github.com/tools/godep \
    && npm update npm --global \
    && git clone --depth 1 --branch v${MATTERMOST_VER} \
      https://github.com/mattermost/platform \
      ${GOPATH}/src/github.com/mattermost/platform \
    && cd ${GOPATH}/src/github.com/mattermost/platform \
    && sed -i.org 's/sudo //g' Makefile \
    && make package BUILD_NUMBER=${MATTERMOST_VER} \
    && tar xfz dist/mattermost-team-linux-amd64.tar.gz -C /opt \
    && cd - \
    && rm -rf \
      ${GOPATH} \
      /usr/lib/go/pkg \
      /usr/lib/node_modules \
      /root/.npm \
      /root/.node-gyp \
      /tmp/npm-* \
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
