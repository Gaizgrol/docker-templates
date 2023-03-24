#!/bin/sh

FILES=$(ls)
SEARCH_FOR='node_modules'

# Expose node_modules to host computer to enable IDE intellisense
if ! [[ "$FILES" =~ "$SEARCH_FOR" ]]; then
  npm ci
fi

ng serve --host 0.0.0.0
