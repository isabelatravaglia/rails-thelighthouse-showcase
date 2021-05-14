#!/bin/bash
set -e

echo "Entrypoint is here"

echo "Listing all files in the current path"
for file in $PWD/*; do
  echo "${file##*/}"
done

echo "replacing database config"
cp config/database.github.yml config/database.yml
echo "finished replacing database config"

echo "entering config path"
cd config

echo "listing files on config path"
for file in $PWD/*; do
  echo "${file##*/}"
done

echo "moving back to parent folder"
cd ..

echo "running db:prepare"
bundle exec rails db:prepare
echo "finished running db:prepare"

exec "$@"