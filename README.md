# docker-wireguard-mitm
[docker-wireguard](https://github.com/fopina/docker-wireguard/) + [wireguard-mitm-gui](https://github.com/fopina/wireguard-mitm-gui)

Available environment variables:

| Name | Description | Default |
| ---- | ----------- | ------- |
| WGMITM_PORT | Port for WebUI to listen on | 8081
| WGMITM_CLIENT_IP | IP of the client that will be MITMed **required** | |
| WGMITM_IP_HEADER | Header that supersedes REMOTE_ADDR for IP detection - this is not used for security, only for convenience in the UI | |
