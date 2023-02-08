#!/usr/bin/env bash
#

VERSIONS=(
  "1.3.1"
  "1.9.0"
  "1.9.1"
  "1.10.0"
  "1.10.1"
  "1.10.2"
  "1.10.3"
  "1.11.0"
  "1.12.0"
  "1.12.1"
  "1.12.2"
  "1.13.0"
  "1.14.0"
  "1.15.0"
  "1.16.0"
  "1.17.0"
  "1.17.1"
  "1.18.0"
  "1.19.0"
  "1.20.0"
  "1.21.0"
  "1.21.1"
  "1.23.0"
  "1.23.1"
  "1.24.0"
  "1.25.0"
  "1.25.1"
  "1.26.0"
  "1.27.0"
  "1.27.1"
  "1.28.0"
)

echo "*** running go mod init pubsubwat"
rm -f go.mod go.sum
go mod init pubsubwat || exit 1

for version in "${VERSIONS[@]}"; do
  echo -n "*** testing version v${version}... "
  echo -n "go get... "
  if ! go get -u "cloud.google.com/go/pubsub@v${version}" 2>/dev/null; then
    echo "...FAILED"
    continue
  fi
  echo -n "go mod tidy..."
  if ! go mod tidy 2>/dev/null; then
    echo "...FAILED"
    continue
  fi
  echo -n "go mod vendor..."
  if ! go mod vendor 2>/dev/null >/dev/null; then
    echo "...FAILED"
    continue
  fi
  echo -n "go vet..."
  if ! go vet -mod=vendor ./...; then
    echo "...FAILED"
    continue
  fi
  echo "...success!"
done
