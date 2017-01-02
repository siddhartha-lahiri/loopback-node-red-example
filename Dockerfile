FROM node:boron-alpine

MAINTAINER Siddhartha Lahiri "siddhartha.lahiri@gmail.com"

# Install bash
RUN apk add --no-cache bash gawk sed grep bc coreutils

# application port
EXPOSE 3000

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red

WORKDIR /usr/src/node-red

COPY . /usr/src/node-red

# Add node-red user so we aren't running as root.
RUN adduser -h /usr/src/node-red -D -H node-red \
    && chown -R node-red:node-red /usr/src/node-red

USER node-red

# Install app dependencies

RUN npm install

CMD [ "npm", "start" ]