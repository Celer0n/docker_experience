FROM ubuntu:24.04

#installing redis
RUN <<EOF 
sudo apt-get install lsb-release curl gpg 
curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg 
sudo chmod 644 /usr/share/keyrings/redis-archive-keyring.gpg 
echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list 
sudo apt-get update
sudo apt-get install redis
sudo systemctl enable redis
EOF

RUN <<EOF
    sed -i 's/^bind 127.0.0.1/bind 0.0.0.0/' /redis/redis.conf
    sed -i 's/^# requirepass .*/requirepass ${REDIS_PASSWORD}/' /etc/redis/redis.conf
    sed -i 's/^protected-mode yes/protected-mode no/' /etc/redis/redis.conf
EOF


#Enable redis port
EXPOSE 6379
HEALTHCHECK --interval=30s --timeout=30s --start-period=5s --retries=3 \
    CMD curl localhost