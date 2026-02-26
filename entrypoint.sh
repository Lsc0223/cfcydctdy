#!/bin/sh
set -e

# 如果 /data 目录为空，先创建它（Render 的磁盘挂载点可能初始为空）
mkdir -p /data

# 仅当 rsa_key.pem 尚不存在时才写入，避免覆盖已有密钥
if [ ! -f /data/rsa_key.pem ]; then
  echo "rsa_key.pem not found, installing pre-baked key..."
  cp /prebuilt/rsa_key.pem /data/rsa_key.pem
  chmod 600 /data/rsa_key.pem
else
  echo "rsa_key.pem already exists, skipping."
fi

# 把官方入口接过来继续跑
exec /usr/local/bin/entrypoint.sh "$@"
