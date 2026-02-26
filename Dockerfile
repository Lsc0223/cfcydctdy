# 使用官方镜像作为基础
FROM vaultwarden/server:latest

# 1. 把预生成的密钥放进镜像（只读层）
COPY custom-rsa-key.pem /prebuilt/rsa_key.pem
RUN chmod 400 /prebuilt/rsa_key.pem

# 2. 把自定义启动脚本放进去
COPY entrypoint.sh /custom-entrypoint.sh
RUN chmod +x /custom-entrypoint.sh

# 3. 覆盖默认入口
ENTRYPOINT ["/custom-entrypoint.sh"]
