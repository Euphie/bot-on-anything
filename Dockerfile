FROM python:3.7.9-alpine

LABEL maintainer="euphie@yahoo.com"
ARG TZ='Asia/Shanghai'

ENV BUILD_PREFIX=/app

RUN apk add --no-cache \
        bash \
    && mkdir ${BUILD_PREFIX} \
    && cd ${BUILD_PREFIX} \
    && /usr/local/bin/python -m pip install --no-cache --upgrade pip \
    && pip install --no-cache   \
        itchat-uos==1.5.0.dev0  \
        werobot  \
        openai



WORKDIR ${BUILD_PREFIX}

COPY . ${BUILD_PREFIX}

RUN chmod +x entrypoint.sh \
    && adduser -D -h /home/noroot -u 1000 -s /bin/bash noroot \
    && chown noroot:noroot ${BUILD_PREFIX}

USER noroot

ENTRYPOINT ["./entrypoint.sh"]
