# Dockerizing
Docker image of oauth2_proxy [fork](https://github.com/outlook/oauth2_proxy) that supports Azure AD groups

## Motivation
Use the Azure AD groups feature before its implemented in the [official](https://github.com/pusher/oauth2_proxy) oauth2_proxy project

## Building

To build a container image execute
```
make build
```
This command will build a docker image with `inspectorio/oauth2-proxy` name and tag equal to version in `version.go`

To build a container with a specific tag run
```
make VERSION=latest build
```

## Pushing 
To push the container image to dockerhub repository `inspectorio/oauth2-proxy` run
```
make push
```
This will push a pre build image with `inspectorio/oauth2-proxy` name and tag equal to version in `version.go`

To push the `inspectorio/oauth2-proxy` with sepcific tag execute

```
make VERSION=latest push
```

## Usage
```
docker run -it --rm -p 8080:8080 inspectorio/oauth2-proxy:latest \
  -client-id='YOUR_CLIENT_ID' \
  -client-secret='YOUR_CLIENT_SECRET' \
  -provider=azure \
  -cookie-expire=30m \
  -cookie-secret=qRDG0j8I \
  -cookie-secure=false \
  -upstream='https://someupstream.youcompany.com' \
  -http-address='0.0.0.0:8080' \
  -email-domain='*' \
  -redirect-url='http://localhost:8080/oauth2/callback' \
  -pass-groups=true \
  -permit-groups='group-that-has-access-to-upstream'
```
