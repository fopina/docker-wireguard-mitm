FROM fopina/wireguard:0.2.0

COPY bin /usr/bin

ENTRYPOINT [ "/usr/bin/mitm-entrypoint.sh" ]
