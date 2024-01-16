#!/bin/bash

if [[ -z "<span class="math-inline">\{SNYK\_CLI\_VERSION\}" \]\]; then
curl \-\-compressed \-\-retry 6 \-\-retry\-all\-errors \\
\[https\://static\.snyk\.io/cli/latest/version\]\(https\://static\.snyk\.io/cli/latest/version\) \> /tmp/\.snyk\-version \\
\|\| curl \-\-compressed \-\-retry 6 \\
\[https\://static\.snyk\.io/cli/latest/version\]\(https\://static\.snyk\.io/cli/latest/version\) \> /tmp/\.snyk\-version
else
echo "</span>{SNYK_CLI_VERSION}" >> /tmp/.snyk-version
fi
cat /tmp/.snyk-version