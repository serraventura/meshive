# Meshive
Mesh & Hive Wrapper to simplify Pipelines

## Build/Use Docker Image locally

```
docker-compose up -d

# Check Command
docker run meshive schema:check --token fs78f68sd6f87sd87f6

# Publish Command
docker run meshive schema:publish --token fs78f68sd6f87sd87f6 --force
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
docker run -v $(pwd)/.meshrc.yml:/meshive/.meshrc.yml serraventura/meshive:latest schema:check --token fs78f68sd6f87sd87f6
```

## Hive Publish command
```
docker run -v $(pwd)/.meshrc.yml:/meshive/.meshrc.yml serraventura/meshive:latest schema:publish --token fs78f68sd6f87sd87f6 --force
```