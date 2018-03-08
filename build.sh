#!/usr/bin/env bash

set -o pipefail  # trace ERR through pipes
set -o errtrace  # trace ERR through 'time command' and other functions
set -o errexit   ## set -e : exit the script if any statement returns a non-true return value

if groups $USER | grep &>/dev/null '\bdocker\b'; then
  CAPTAIN="captain"
else
  CAPTAIN="sudo captain"
fi

BUILD_DATE=$(date --iso-8601=seconds) \
  VCS_REF=$(git describe --tags --dirty) \
  VERSION=$(git describe --tags --dirty) \
  $CAPTAIN build
