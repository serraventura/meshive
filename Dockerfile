FROM node:current-alpine3.15

WORKDIR /meshive

RUN apk --no-cache add curl

RUN curl -O https://raw.githubusercontent.com/serraventura/meshive/main/package.json
RUN curl -O https://raw.githubusercontent.com/serraventura/meshive/main/start.sh

RUN yarn install --frozen-lockfile

# check if both Hive and Mesh works
RUN npx hive help
RUN npx mesh help

COPY ./.meshrc.yml .

RUN npx mesh build

USER root
RUN chmod a+x start.sh

ENTRYPOINT ["./start.sh"]
