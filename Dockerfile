ARG WGMITMVERSION=0.1.1

FROM alpine:3.19 as bin
ARG TARGETOS
ARG TARGETARCH
ARG TARGETVARIANT
ARG WGMITMVERSION
ADD https://github.com/fopina/wireguard-mitm-gui/releases/download/v${WGMITMVERSION}/wgmitmgui_${WGMITMVERSION}_${TARGETOS}_${TARGETARCH}${TARGETVARIANT} /wgmitmgui
RUN chmod a+x /wgmitmgui

FROM fopina/wireguard:tools-1.0.20210914-r3

COPY --from=bin /wgmitmgui /wgmitmgui

COPY bin /usr/bin

ENV WGMITM_PORT 8081
# not set but defined here to highlight its requirement
ENV WGMITM_CLIENT_IP ''
ENV WGMITM_IP_HEADER ''

ENTRYPOINT [ "/usr/bin/mitm-entrypoint.sh" ]
