#!/bin/sh

generate_salt() {
  cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 48 | head -n 1
}

initialize() {
  if [[ -z ${SQL_DATA_SOURCE} ]] && [[ ! -z ${MYSQL_PORT_3306_TCP_ADDR} ]]; then
    local DB_HOST=${DB_HOST:-${MYSQL_PORT_3306_TCP_ADDR}}
    local DB_PORT=${DB_PORT:-${MYSQL_PORT_3306_TCP_PORT}}
    local DB_USER=${DB_USER:-${MYSQL_ENV_MYSQL_USER}}
    local DB_PASS=${DB_PASS:-${MYSQL_ENV_MYSQL_PASSWORD}}
    local DB_NAME=${DB_NAME:-${MYSQL_ENV_MYSQL_DATABASE}}
    export SQL_DRIVER_NAME=${SQL_DRIVER_NAME:-"mysql"}
    export SQL_DATA_SOURCE="${DB_USER}:${DB_PASS}@tcp(${DB_HOST}:${DB_PORT})/${DB_NAME}?${DB_PARAMS:-"charset=utf8mb4,utf8"}"

  elif [[ -z ${SQL_DATA_SOURCE} ]] && [[ ! -z ${POSTGRES_PORT_5432_TCP_ADDR} ]]; then
    local DB_HOST=${DB_HOST:-${POSTGRES_PORT_5432_TCP_ADDR}}
    local DB_PORT=${DB_PORT:-${POSTGRES_PORT_5432_TCP_PORT}}
    local DB_USER=${DB_USER:-${POSTGRES_ENV_POSTGRES_USER}}
    local DB_PASS=${DB_PASS:-${POSTGRES_ENV_POSTGRES_PASSWORD}}
    local DB_NAME=${DB_NAME:-${POSTGRES_ENV_POSTGRES_DB:-${POSTGRES_ENV_POSTGRES_USER}}}
    export SQL_DRIVER_NAME=${SQL_DRIVER_NAME:-"postgres"}
    export SQL_DATA_SOURCE="postgres://${DB_USER}:${DB_PASS}@${DB_HOST}:${DB_PORT}/${DB_NAME}?${DB_PARAMS:-"sslmode=disable&connect_timeout=10"}"

  elif [[ -z ${SQL_DATA_SOURCE} ]] && [[ ! -z ${RDS_HOSTNAME} ]]; then
    export SQL_DATA_SOURCE="${RDS_USERNAME}:${RDS_PASSWORD}@tcp(${RDS_HOSTNAME}:${RDS_PORT})/${RDS_DB_NAME}?charset=utf8mb4,utf8"
  fi

  if [[ ! -f /etc/mattermost/env-cache ]]; then
    cat << EOF > /etc/mattermost/env-cache
export EMAIL_INVITE_SALT=${EMAIL_INVITE_SALT:-"`generate_salt`"}
export EMAIL_PASSWORD_RESET_SALT=${EMAIL_PASSWORD_RESET_SALT:-"`generate_salt`"}
export FILE_PUBLIC_LINK_SALT=${FILE_PUBLIC_LINK_SALT:-"`generate_salt`"}
export SQL_AT_REST_ENCRYPT_KEY=${SQL_AT_REST_ENCRYPT_KEY:-"`generate_salt`"}
EOF
  fi

  if [[ -z ${EMAIL_INVITE_SALT} ]] \
    || [[ -z ${EMAIL_PASSWORD_RESET_SALT} ]] \
    || [[ -z ${FILE_PUBLIC_LINK_SALT} ]] \
    || [[ -z ${SQL_AT_REST_ENCRYPT_KEY} ]]; then
    source /etc/mattermost/env-cache
  fi

  cp /opt/mattermost/runtime/config.json.tmpl /etc/mattermost/config.json.tmpl \
    && chown mattermost: -R /etc/mattermost /var/mattermost/data /var/log/mattermost \
    && chmod o-rw -R /etc/mattermost /var/mattermost/data /var/log/mattermost
}

initialize

exec "$@"
