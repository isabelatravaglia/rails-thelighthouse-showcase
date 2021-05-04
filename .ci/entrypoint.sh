#!/bin/bash
set -e

echo "Entrypoint is here"

echo "Listing all files in the current path"
for file in $PWD/*; do
  echo "${file##*/}"
done

# echo "Running Bundle"
# bundle check || bundle install

# echo "Running Yarn"
# yarn install

# echo "Precompiling assets"
# bundle exec rake assets:precompile

# echo "Removing a potentially pre-existing server.pid for Rails"
# Remove a potentially pre-existing server.pid for Rails.
# rm -f /app/tmp/pids/server.pid

# echo "Running CMD"
# Then exec the container's main process (what's set as CMD in the Dockerfile).

bundle exec rails db:prepare
# bundle exec rails assets:precompile
# bundle exec rails s -b 0.0.0.0
exec "$@"