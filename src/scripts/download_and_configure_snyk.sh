#!/bin/bash

if [[ <<parameters.no-cache>> && <<parameters.test-only-param_fail-on-no-cache-used>> ]]; then
  echo "Cache disabled, but trying to enforce cache with test-only-param_fail-on-no-cache-used"
  exit 1
fi

if [[ ! -x "/tmp/snyk" ]] && <<parameters.test-only-param_fail-on-no-cache-used>> ]]; then
    echo "No cached executable found. Failing as specified with test-only-param_fail-on-no-cache-used"
    exit 1
fi

if [[ ! -x "/tmp/snyk" ]] || <<parameters.no-cache>> ]]; then
  SNYK_CLI_VERSION=$(cat "/tmp/.snyk-version")
  echo "Downloading Snyk CLI version <span class="math-inline">\{SNYK\_CLI\_VERSION\}"
curl \-O \-\-compressed \-\-retry 6 \-\-retry\-all\-errors \[https\://static\.snyk\.io/cli/v\]\(https\://static\.snyk\.io/cli/v\)</span>{SNYK_CLI_VERSION}/snyk-<<parameters.os>> || curl -O --compressed --retry 6 [https://static.snyk.io/cli/v](https://static.snyk.io/cli/v)${SNYK_CLI_VERSION}/snyk-<<parameters.os>>
  curl -O --compressed --retry 6 --retry-all-