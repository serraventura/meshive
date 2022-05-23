#!/bin/sh
npx mesh build
npx hive $1 ./.mesh/schema.graphql $2 $3 $4
