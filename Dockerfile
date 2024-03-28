ARG WGMITMVERSION=0.1.1

FROM ghcr.io/fopina/wireguard:1.0.20210914-r3 as base

FROM base as bin
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
ARG WGMITMVERSION
ADD https://github.com/fopina/wireguard-mitm-gui/releases/download/v${WGMITMVERSION}/wgmitmgui_${WGMITMVERSION}_${TARGETOS}_${TARGETARCH}${TARGETVARIANT} /wgmitmgui
RUN chmod a+x /wgmitmgui

FROM base

COPY --from=bin /wgmitmgui /wgmitmgui

COPY bin /usr/bin

ENV WGMITM_PORT 8081
# not set but defined here to highlight its requirement
ENV WGMITM_CLIENT_IP ''
ENV WGMITM_IP_HEADER ''

ENTRYPOINT [ "/usr/bin/mitm-entrypoint.sh" ]
