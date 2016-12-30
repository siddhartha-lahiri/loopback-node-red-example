From node:argon
MAINTAINER Siddhartha Lahiri "siddhartha.lahiri@gmail.com"

# application port
EXPOSE 3000

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Install app dependencies
COPY . /usr/src/app
RUN npm install

CMD [ "start" ]