#!/bin/bash

set -ouex pipefail

case "$flavor" in
  "base")
    SUFFIX="";;
  *nvidia-closed)
    SUFFIX="-${flavor/-closed/}";;
  *nvidia)
    SUFFIX="-$flavor-open";;
  *)
    SUFFIX="-$flavor";;
esac

UPSTREAM="ghcr.io/ublue-os/bazzite$SUFFIX:latest"
echo "upstream=$UPSTREAM" >> $GITHUB_OUTPUT
UPSTREAM_VER="$(docker manifest inspect -v "$UPSTREAM" | jq -r '.OCIManifest.annotations["org.opencontainers.image.version"]')"
echo "upstream_ver=$UPSTREAM_VER" >> $GITHUB_OUTPUT
