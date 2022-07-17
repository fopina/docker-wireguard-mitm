ARG WGMITMVERSION=0.1.1

FROM scratch as bin
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
ARG WGMITMVERSION
ADD https://github.com/fopina/wireguard-mitm-gui/releases/download/v${WGMITMVERSION}/wgmitmgui_${WGMITMVERSION}_${TARGETOS}_${TARGETARCH}${TARGETVARIANT} /wgmitmgui
RUN chmod a+x /wgmitmgui

FROM fopina/wireguard:0.2.0

COPY --from=bin /wgmitmgui /wgmitmgui

COPY bin /usr/bin

ENV WGMITM_PORT 8081
# not set but defined here to highlight its requirement
ENV WGMITM_CLIENT_IP ''
ENV WGMITM_IP_HEADER ''

ENTRYPOINT [ "/usr/bin/mitm-entrypoint.sh" ]
