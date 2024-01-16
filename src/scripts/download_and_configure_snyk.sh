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
  echo "Downloading Snyk CLI version <span class="math-inline">{SNYK_CLI_VERSION}"
    curl -O --compressed --retry 6 --retry-all-errors https://static.snyk.io/cli/v${SNYK_CLI_VERSION}/snyk-<<parameters.os>> || curl -O --compressed --retry 6 https://static.snyk.io/cli/v${SNYK_CLI_VERSION}/snyk-<<parameters.os>>
    curl -O --compressed --retry 6 --retry-all-errors https://static.snyk.io/cli/v${SNYK_CLI_VERSION}/snyk-<<parameters.os>>.sha256 || curl -O --compressed --retry 6 https://static.snyk.io/cli/v${SNYK_CLI_VERSION}/snyk-<<parameters.os>>.sha256
    sha256sum -c snyk-<<parameters.os>>.sha256
    sudo mv snyk-<<parameters.os>> /tmp/snyk
    sudo chmod +x /tmp/snyk
fi
sudo ln -sf /tmp/snyk /usr/local/bin/snyk
snyk config set disableSuggestions=true
<<#parameters.token-variable>>snyk auth $<<parameters.token-variable>><</parameters.token-variable>>