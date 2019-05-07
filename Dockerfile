# ----------------------------------
# Parkervcp Dockerfile Image
# Environment: nodejs 10
# Minimum Panel Version: 0.6.0
# ----------------------------------
FROM        node:10-alpine

LABEL       author="Michael Parker" maintainer="parker@pterodactyl.io"

RUN         apk add --no-cache --update libc6-compat ffmpeg python git \
            && adduser -D -h /home/container container

USER        container
ENV         USER=container HOME=/home/container
WORKDIR     /home/container

COPY        ./entrypoint.sh /entrypoint.sh
CMD         ["/bin/ash", "/entrypoint.sh"]
