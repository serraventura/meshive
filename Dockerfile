FROM node:current-alpine3.15

WORKDIR /meshive

RUN apk --no-cache add curl

RUN curl -O -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/serraventura/meshive/main/package.json
RUN curl -O -H 'Cache-Control: no-cache' https://raw.githubusercontent.com/serraventura/meshive/main/start.sh
# COPY ./start.sh .

RUN yarn install --frozen-lockfile

# check if both Hive and Mesh works
RUN npx hive help
RUN npx mesh help

# In case this image is used locally we can copy Mesh config on build time
COPY ./.meshrc.yml .

USER root
RUN chmod a+x start.sh

ENTRYPOINT ["./start.sh"]
