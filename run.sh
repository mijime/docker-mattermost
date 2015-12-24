#!/bin/bash

exec start-stop-daemon \
  --start \
  --chuid mattermost \
  --chdir /var/mattermost \
  --exec /var/mattermost/bin/platform \
  -- -config=/etc/mattermost/config.json "$@"
