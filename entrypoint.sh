#!/bin/sh
# 替换环境变量并生成实际的 config.json
envsubst < /etc/xray/config.json.template > /etc/xray/config.json

echo "Xray starting on PORT ${PORT} with WS PATH ${WS_PATH}..."
exec xray run -c /etc/xray/config.json
