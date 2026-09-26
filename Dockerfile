FROM alpine:latest

# 安装 xray、ca-certificates 和 envsubst
RUN apk add --no-cache ca-certificates curl gettext

# 下载并安装最新的 Xray-core
RUN bash -c "$(curl -L https://github.com/XTLS/Xray-install/raw/main/install-release.sh)" @ install

COPY config.json.template /etc/xray/config.json.template
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
