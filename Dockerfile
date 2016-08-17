FROM ruby:latest

COPY bundle_config /usr/local/bundle/config

RUN mkdir -p /workdir

WORKDIR /workdir
