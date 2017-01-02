FROM lahirs2/alpine-node-python:latest

MAINTAINER Siddhartha Lahiri "siddhartha.lahiri@gmail.com"

# application port
EXPOSE 3000

# Home directory for Node-RED application source code.
RUN mkdir /home/node-red
WORKDIR /home/node-red

COPY . /home/node-red

RUN addgroup node-red \
    && adduser -h /home/node-red -s /bin/sh -D -G node-red node-red \
    && mkdir /data \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /home/node-red

USER node-red
VOLUME /data

# Install app dependencies
RUN npm config set loglevel warn
RUN npm install --quiet --unsafe-perm

CMD [ "npm", "start" ]