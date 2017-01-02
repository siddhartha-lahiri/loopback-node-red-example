FROM node:boron-alpine

LABEL version="0.0.1"
LABEL description="alpine-node-python"
MAINTAINER Siddhartha Lahiri "siddhartha.lahiri@gmail.com"

# Install bash
RUN apk add --no-cache bash gawk sed grep bc coreutils

# Install Python
RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*

RUN pip install --upgrade pip