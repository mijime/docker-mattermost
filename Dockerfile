FROM debian

ENV DEBIAN_FRONTEND=noninteractive
RUN mkdir -p /usr/local/src /usr/local/bin

ENV CONFD_VER=0.11.0

ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VER}/confd-${CONFD_VER}-linux-amd64 /usr/local/bin/confd
# ADD assets/confd-${CONFD_VER}-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

ENV MATTERMOST_VER=1.3.0

ADD https://github.com/mattermost/platform/releases/download/v${MATTERMOST_VER}/mattermost.tar.gz /usr/local/src/mattermost.tar.gz
RUN tar xvfz /usr/local/src/mattermost.tar.gz -C /var
# ADD assets/mattermost.tar.gz /var
RUN adduser --home /var/mattermost --no-create-home --ingroup daemon --shell /bin/false --system mattermost
RUN mkdir -p /etc/mattermost /var/mattermost/data /var/mattermost/logs
RUN chown -R mattermost: /etc/mattermost /var/mattermost/data /var/mattermost/logs

EXPOSE 8080
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "run.sh" ]

ADD confd /etc/confd

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ADD run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

WORKDIR /var/mattermost
VOLUME  /etc/mattermost /var/mattermost/data /var/mattermost/logs
