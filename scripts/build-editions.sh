#!/usr/bin/env bash

set -e

MATTERMOST_VER="$1"

if [[ -z "${MATTERMOST_VER}" || "${MATTERMOST_VER}" == "" || ! "${MATTERMOST_VER}" =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]; then
    echo "You need to specify a correctly formatted version string to build the Mattermost images!"
    exit 1
fi

VERSIONARRAY=( ${MATTERMOST_VER//./ } )
MAJOR="${VERSIONARRAY[0]}"
MINOR="${VERSIONARRAY[1]}"
HUBREPO="mijime/mattermost"

for edition in team enterprise; do
    docker build \
    --build-arg MATTERMOST_VER=${MATTERMOST_VER} \
    --build-arg MATTERMOST_EDITION=${edition} \
    -f Dockerfile \
    -t "${HUBREPO}":latest \
    -t "${HUBREPO}":"${MATTERMOST_VER}"-${edition} \
    -t "${HUBREPO}":"${MAJOR}"."${MINOR}"-${edition} \
    -t "${HUBREPO}":"${MAJOR}"-${edition} .

    for pushstring in "${MATTERMOST_VER}-${edition}" "${MAJOR}.${MINOR}-${edition}" "${MAJOR}-${edition}"; do
        docker push "${HUBREPO}:${pushstring}"
    done

    # Team Edition will have the 'latest' tag
    if [[ "${edition}" == "team" ]]; then
        docker build -f Dockerfile -t "${HUBREPO}":latest .
        docker push "${HUBREPO}":latest
    fi

done
