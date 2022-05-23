ARG HIVE_CMD="schema:check"
ARG HIVE_TOKEN=""

FROM node:current-alpine3.15

WORKDIR /meshive

RUN apk --no-cache add curl
RUN apk add --no-cache bash

RUN curl https://raw.githubusercontent.com/serraventura/meshive/main/package.json >> package.json
RUN curl -O https://raw.githubusercontent.com/serraventura/meshive/main/start.sh

RUN yarn install --frozen-lockfile

# check if both Hive and Mesh works
RUN npx hive help
RUN npx mesh help

COPY ./.meshrc.yml .

RUN npx mesh build

USER root
RUN chmod a+x start.sh

# ENV ENV_HIVE_CMD="schema:check"
# ENV ENV_HIVE_TOKEN="xxxxxx"

ENTRYPOINT ["./start.sh"]
# CMD ["npx", "hive", "$ENV_HIVE_CMD", "./.mesh/schema.graphql", "--token", "$ENV_HIVE_TOKEN"]
# CMD ["npx", "hive", "$ENV_HIVE_CMD", ":", "$ENV_HIVE_SUBCMD", "$ENV_MESH_GQL_FILE", "--token", "$ENV_HIVE_TOKEN"]
# CMD ["npx", "hive", "help"]
