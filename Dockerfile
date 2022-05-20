FROM node:current-alpine3.15

WORKDIR /meshive

RUN curl https://raw.githubusercontent.com/serraventura/meshive/main/package.json >> package.json
RUN yarn install
RUN npx hive help
RUN npx mesh help

COPY .meshrc.yml .

RUN npx mesh build

ENTRYPOINT ["npx", "hive"]
