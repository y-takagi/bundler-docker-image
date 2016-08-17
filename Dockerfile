FROM ruby:2.3.1-alpine

RUN apk add --no-cache build-base

COPY bundle_config /usr/local/bundle/config

RUN mkdir -p /workdir

WORKDIR /workdir
