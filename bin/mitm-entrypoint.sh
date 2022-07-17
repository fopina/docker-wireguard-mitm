#!/bin/sh

set -e

/wgmitmgui --bind 0.0.0.0:${WGMITM_PORT} \
           --client-ip "${WGMITM_CLIENT_IP}" \
           --ip-header "${WGMITM_IP_HEADER}" &

MITMPID="$!"
sleep 1
kill -0 $MITMPID >& /dev/null

exec /usr/bin/entrypoint.sh
