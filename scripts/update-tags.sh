#!/usr/bin/env bash

set -ue

MATTERMOST_VER="$1"
MATTERMOST_EDITION=(team enterprise)
PREFIX_CMD=
LATEST_FLG=
IS_MERGE=

while [[ $# -gt 0 ]]
do
    case $1 in
    -D|--dry-run)
      PREFIX_CMD=echo
      shift
      ;;
    -L|--latest)
      LATEST_FLG=1
      shift
      ;;
    --merge-master)
      IS_MERGE=1
      shift
      ;;
    --edition)
      MATTERMOST_EDITION=($2)
      shift 2 || exit 2
      ;;
    --version|--tag)
      MATTERMOST_VER=$2
      shift 2 || exit 2
      ;;
    *)
      MATTERMOST_VER="$1"
      shift
      ;;
    esac
done

if [[ -z "${MATTERMOST_VER}" || "${MATTERMOST_VER}" == "" || ! "${MATTERMOST_VER}" =~ [0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3} ]]; then
    echo "You need to specify a correctly formatted version string to build the Mattermost images!"
    exit 1
fi

VERSIONARRAY=( ${MATTERMOST_VER//./ } )
MAJOR="${VERSIONARRAY[0]}"
MINOR="${VERSIONARRAY[1]}"

for edition in ${MATTERMOST_EDITION[@]}
do
  VER_SUFFIX=
  case "${edition}" in
    enterprise)
      VER_SUFFIX="-${edition}"
      ;;
  esac
  MAJOR_BRANCH="${MAJOR}${VER_SUFFIX}"
  MINOR_BRANCH="${MAJOR}.${MINOR}${VER_SUFFIX}"

  ${PREFIX_CMD} git branch "${MINOR_BRANCH}" master || true
  ${PREFIX_CMD} git checkout "${MINOR_BRANCH}"
  if [[ -n ${IS_MERGE} ]]
  then ${PREFIX_CMD} git merge --ff --no-commit master
  fi
  ${PREFIX_CMD} make -B MATTERMOST_VER=${MATTERMOST_VER} MATTERMOST_EDITION=${edition}
  ${PREFIX_CMD} git commit . --message ":tada: Update version ${MATTERMOST_VER} for ${edition}" || true
  ${PREFIX_CMD} git tag --force -a "${MATTERMOST_VER}${VER_SUFFIX}" --message ":tada: Update version"

  if [[ -n ${LATEST_FLG} ]]
  then
    ${PREFIX_CMD} git branch "${MAJOR_BRANCH}" master || true
    ${PREFIX_CMD} git checkout "${MAJOR_BRANCH}" || true
    ${PREFIX_CMD} git merge --ff "${MINOR_BRANCH}"
  fi
done
