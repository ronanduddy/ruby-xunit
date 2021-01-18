FROM ruby:3.0.0-alpine3.12
MAINTAINER Ronan Duddy

ENV BUILD_PACKAGES build-base less git

RUN apk update && \
    apk upgrade && \
    apk add --no-cache $BUILD_PACKAGES

WORKDIR /usr/src/app

COPY . .
RUN bundle install
