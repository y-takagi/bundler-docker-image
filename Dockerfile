FROM ruby:2.3-alpine

RUN apk add --no-cache git

COPY bundle_config /usr/local/bundle/config

RUN mkdir -p /workdir

WORKDIR /workdir
