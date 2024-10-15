FROM redis:alpine

COPY redis.conf /usr/local/etc/redis/redis.conf

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

#Enable redis port
EXPOSE 6379

HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD redis-cli ping || exit 1