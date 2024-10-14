FROM redis:alpine

RUN <<EOF
    sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/' /redis/redis.conf
    sed -i 's/^# requirepass .*/requirepass ${REDIS_PASSWORD}/' /etc/redis/redis.conf
    sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf
EOF

#Enable redis port
EXPOSE 6379

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD sudo systemctl status redis