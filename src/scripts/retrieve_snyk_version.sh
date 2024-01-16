#!/bin/bash

if [[ -z "${SNYK_CLI_VERSION}" ]]; then
  curl --compressed --retry 6 --retry-all-errors https://static.snyk.io/cli/latest/version > /tmp/.snyk-version || curl --compressed --retry 6 https://static.snyk.io/cli/latest/version > /tmp/.snyk-version 
else
  echo "${SNYK_CLI_VERSION}" >> /tmp/.snyk-version
fi
cat /tmp/.snyk-version