#!/bin/sh

FILES=$(ls -1)
FILE_COUNT=$(printf '%b\n' $FILES | wc -l)
SEARCH_FOR='node_modules'

# No files: Create application from scratch
if ! [[ "$FILE_COUNT" =~ "0" ]]; then
  printf 'n' | ng new front-angular --directory . --style scss --routing --skip-git
fi

# Expose node_modules to host computer to enable IDE intellisense
if ! [[ "$FILES" =~ "$SEARCH_FOR" ]]; then
  npm ci
fi

ng serve --host 0.0.0.0
