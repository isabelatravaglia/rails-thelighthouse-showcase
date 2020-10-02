# Establishes the Ruby version on the Docker image. Must be compatible to the Ruby version on the Rails app.
FROM ruby:2.6.6

COPY Gemfile* /application/

WORKDIR /application

# To avoid bundler error and install bundler to allow other dependencies
# Installs dependencies
# Installing Nodejs
# Install yarn
# Run yarn install to install JavaScript dependencies.

RUN gem install bundler \
&& bundle config set deployment 'true' \
&& bundle config set without 'development test' \
&& bundle install \
&& apt-get update && apt-get install -y \
  curl \
  build-essential \
  libpq-dev &&\
  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y nodejs yarn && \
  yarn install --check-files

# Copy the application folder from the Rails app to the docker image.
COPY . /application

# Change to the application's directory
WORKDIR /application

# The last instruction
ENTRYPOINT ./entrypoint.sh

