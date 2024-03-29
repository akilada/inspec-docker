FROM ruby:alpine
LABEL maintainer="Chef Software, Inc. <docker@chef.io>"

ARG EXPEDITOR_VERSION
ARG VERSION=4.16.0
ARG GEM_SOURCE=https://rubygems.org

# Allow VERSION below to be controlled by either VERSION or EXPEDITOR_VERSION build arguments
ENV VERSION ${EXPEDITOR_VERSION:-${VERSION}}

RUN mkdir -p /share
RUN apk add --update build-base libxml2-dev libffi-dev git openssh-client
RUN gem install --no-document --source ${GEM_SOURCE} --version ${VERSION} inspec
RUN gem install --no-document --source ${GEM_SOURCE} --version ${VERSION} inspec-bin && \
    gem install aws-sdk
RUN inspec --chef-license=accept && \
    inspec plugin install inspec-iggy
RUN apk del build-base

ENTRYPOINT ["/bin/sh"]
VOLUME ["/share"]
WORKDIR /share