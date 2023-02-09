FROM --platform=linux/amd64 golang:1.18-alpine

RUN apk add bash build-base

WORKDIR /test

ADD test.sh .
ADD pubsubwat.go .

ENTRYPOINT "/test/test.sh"
