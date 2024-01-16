#!/bin/bash

if [[ "<<parameters.os>>" == "alpine" && "<<parameters.install-alpine-dependencies>>" == "true" ]];
 then
  # Install required dependencies for Alpine Linux
  apk add -q --no-progress --no-cache curl wget libstdc++ sudo
fi
