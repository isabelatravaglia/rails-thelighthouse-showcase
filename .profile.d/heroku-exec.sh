#!/usr/bin/env bash

set +o posix
[ -z "$SSH_CLIENT" ] && source <(curl --fail --retry 7 -sSL "$HEROKU_EXEC_URL")