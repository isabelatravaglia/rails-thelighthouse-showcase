#!/bin/bash
set -e

echo "Entrypoint is here"

echo "Listing all files in the current path"
for file in $PWD/*; do
  echo "${file##*/}"
done

cp config/database.github.yml config/database.yml
bundle exec rails db:prepare

exec "$@"