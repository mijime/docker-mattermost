#!/bin/bash

generate_salt() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 48 | head -n 1
}

[[ -f /etc/mattermost/env ]] || cat <<EOF > /etc/mattermost/env
export EMAIL_INVITESALT=${EMAIL_INVITESALT:-$(generate_salt)}
export EMAIL_PASSWORDRESETSALT=${EMAIL_PASSWORDRESETSALT:-$(generate_salt)}
export FILE_PUBLICLINKSALT=${FILE_PUBLICLINKSALT:-$(generate_salt)}
export SQL_ATRESTENCRYPTKEY=${SQL_ATRESTENCRYPTKEY:-$(generate_salt)}
EOF

source /etc/mattermost/env

declare -a confd_backends=(${CONFD_BACKEND:-env})
confd -onetime -backend "${confd_backends[@]}"
exec "$@"
