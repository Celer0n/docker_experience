FROM redis:alpine

ARG APP_VERSION=1.0

LABEL version=${APP_VERSION}

COPY redis.conf /usr/local/etc/redis/redis.conf

CMD ["redis-server", "/usr/local/etc/redis/redis.conf"]

#Enable redis port
EXPOSE 6379