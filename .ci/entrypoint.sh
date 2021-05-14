#!/bin/bash
set -e

echo "Entrypoint is here"

echo "Listing all files in the current path"
for file in $PWD/*; do
  echo "${file##*/}"
done

bundle exec rails db:prepare

exec "$@"