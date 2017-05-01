#!/usr/bin/env bash

set -e

MATTERMOST_VER="$1"

if [[ -z "${MATTERMOST_VER}" || "${MATTERMOST_VER}" == "" ]]; then
    echo "You need to specify a version to build the Mattermost images!"
    exit 1
fi

VERSIONARRAY=( ${MATTERMOST_VER//./ } )
MAJOR="${VERSIONARRAY[0]}"
MINOR="${VERSIONARRAY[1]}"
HUBREPO="mijime/mattermost"

for edition in team enterprise; do

    sed "s/%%EDITION%%/${edition}/g;s/%%VERSION%%/${MATTERMOST_VER}/g;" Dockerfile.template > Dockerfile.${edition}

    docker build \
    -f Dockerfile.${edition} \
    -t "${HUBREPO}":latest \
    -t "${HUBREPO}":"${MATTERMOST_VER}"-${edition} \
    -t "${HUBREPO}":"${MAJOR}"."${MINOR}"-${edition} \
    -t "${HUBREPO}":"${MAJOR}"-${edition} .

    for pushstring in "${HUBREPO}:${MATTERMOST_VER}-${edition}" "${HUBREPO}:${MAJOR}.${MINOR}-${edition}" "${HUBREPO}:${MAJOR}-${edition}"; do
        docker push "${pushstring}"
    done

    # Team Edition will have the 'latest' tag
    if [[ "${edition}" == "team" ]]; then
        docker build -f Dockerfile.team -t "${HUBREPO}":latest .
        docker push "${HUBREPO}":latest
    fi

done
