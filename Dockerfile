FROM debian

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y ca-certificates
RUN mkdir -p /usr/local/src /usr/local/bin

ENV CONFD_VER=0.11.0
ADD https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VER}/confd-${CONFD_VER}-linux-amd64 /usr/local/bin/confd
# COPY assets/confd-${CONFD_VER}-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

ENV MATTERMOST_VER=2.0.0-rc1
ADD https://github.com/mattermost/platform/releases/download/v${MATTERMOST_VER}/mattermost.tar.gz /usr/local/src/mattermost.tar.gz
# COPY assets/v${MATTERMOST_VER}-mattermost.tar.gz /usr/local/src/mattermost.tar.gz
RUN tar xfz /usr/local/src/mattermost.tar.gz -C /var
RUN adduser --home /var/mattermost --no-create-home --ingroup daemon --shell /bin/false --system mattermost
RUN mkdir -p /etc/mattermost /var/mattermost/data /var/mattermost/logs

EXPOSE 8080
ENTRYPOINT [ "/entrypoint.sh" ]
CMD [ "run.sh" ]

COPY confd /etc/confd

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

COPY run.sh /usr/local/bin/run.sh
RUN chmod +x /usr/local/bin/run.sh

WORKDIR /var/mattermost
VOLUME  /etc/mattermost /var/mattermost/data /var/mattermost/logs
