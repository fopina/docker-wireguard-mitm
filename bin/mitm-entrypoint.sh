#!/bin/sh

/wgmitmgui --bind 0.0.0.0:${WGMITM_PORT} \
           --client-ip ${WGMITM_CLIENT_IP} \
           --ip-header ${WGMITM_IP_HEADER} &

exec /usr/bin/entrypoint.sh
