# syntax=docker/dockerfile:1

##
## Build
##
FROM golang:1.16-buster AS build

WORKDIR /app

COPY go.mod ./
COPY go.sum ./
RUN go mod download

COPY *.go ./

RUN go build -o /tree_rest

##
## Deploy
##
FROM gcr.io/distroless/base-debian10

WORKDIR /

COPY --from=build /tree_rest /tree_rest

EXPOSE 8080

USER nonroot:nonroot

ENV GIN_MODE=release

ENTRYPOINT ["/tree_rest"]