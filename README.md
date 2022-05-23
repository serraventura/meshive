# Meshive
Mesh & Hive Wrapper to simplify Pipelines

## Build/Use Docker Image locally

```
docker-compose up -d
```

## Mesh config sample

.meshrc.yml
> Must be on root folder as long with Dockerfile

```
sources:
  - name: Petstore
    handler:
      newOpenapi:
        oasFilePath: https://petstore.swagger.io/v2/swagger.json

```

## Hive Check command

```
docker run -v $(pwd)/.meshrc.yml:/meshive/.meshrc.yml serraventura/meshive:latest schema:check --token 62c833ef4e0de057c998c5471ebcadbf
```

## Hive Publish command
```
docker run -v $(pwd)/.meshrc.yml:/meshive/.meshrc.yml serraventura/meshive:latest schema:publish --token 62c833ef4e0de057c998c5471ebcadbf --force
```