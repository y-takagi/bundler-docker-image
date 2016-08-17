FROM ruby:2.3-alpine

COPY bundle_config /usr/local/bundle/config

RUN mkdir -p /workdir

WORKDIR /workdir
