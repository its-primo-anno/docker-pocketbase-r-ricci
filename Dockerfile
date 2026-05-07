FROM alpine:latest

ARG PB_VERSION=0.20.0

RUN apk add --no-cache \
    unzip \
    ca-certificates

RUN mkdir -p /pocketbase
WORKDIR /pocketbase

ADD https://github.com/pocketbase/pocketbase/releases/download/v${PB_VERSION}/pocketbase_${PB_VERSION}_linux_amd64.zip /tmp/pocketbase.zip
RUN unzip /tmp/pocketbase.zip -d /pocketbase/

ADD ./deployment-cobalt/pocketbase/pb_data /pocketbase/pb_data
ADD ./deployment-cobalt/pocketbase/pb_migrations /pocketbase/pb_migrations
