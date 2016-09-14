FROM mhart/alpine-node:6.5.0

RUN mkdir -p /opt/app
WORKDIR /opt/app
ADD package.json npm-shrinkwrap.json /opt/app/
RUN npm config set registry https://registry.npmjs.org/

RUN apk add --no-cache --virtual build-dependencies git make gcc g++ gmp python bash && \
  rm -rf /var/cache/apk/* && \
  npm install --production && \
  npm cache clean && \
  apk del build-dependencies

# use changes to package.json to force Docker not to use the cache
# when we change our application's nodejs dependencies:

ADD . /opt/app
