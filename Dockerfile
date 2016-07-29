FROM mhart/alpine-node:4.2.4

RUN apk add --update git make gcc g++ gmp python bash
RUN mkdir -p /opt/app
WORKDIR /opt/app

ADD package.json npm-shrinkwrap.json /opt/app/
RUN npm config set registry https://registry.npmjs.org/
ADD .npmrc /root/.npmrc
RUN cd /opt/app && npm install
RUN rm -f /root/.npmrc

ADD . /opt/app
RUN rm -f .npmrc
