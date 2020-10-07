# Establishes the Ruby version on the Docker image. Must be compatible to the Ruby version on the Rails app.
FROM ruby:2.6.6

RUN gem install bundler
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
  apt-get update && apt-get install -y yarn
RUN mkdir /application
WORKDIR /application
COPY Gemfile /application/Gemfile
COPY Gemfile.lock /application/Gemfile.lock
RUN bundle install
COPY . /application

# COPY Gemfile* /application/

# WORKDIR /application

# To avoid bundler error and install bundler to allow other dependencies
# Installs dependencies
# Installing Nodejs
# Install yarn
# Run yarn install to install JavaScript dependencies.

# RUN gem install bundler \
# && bundle config set deployment 'true' \
# && bundle config set without 'development test' \
# && bundle install \
# && apt-get update && apt-get install -y \
#   curl \
#   build-essential \
#   libpq-dev &&\
#   curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
#   curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#   echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#   apt-get update && apt-get install -y nodejs yarn

# To allow Heroku Exec (connect to the container), ensure the default shell is Bash by including the following line in your Dockerfile:
# RUN rm /bin/sh && ln -s /bin/bash /bin/sh

# Copy the application folder from the Rails app to the docker image.
# COPY . /application

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
# CMD ["rails", "server", "-b", "0.0.0.0"]

# Change to the application's directory
# WORKDIR /application

RUN RAILS_ENV=production bundle exec rake assets:precompile

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]

# The last instruction
# CMD ["rails", "server", "-b", "0.0.0.0"]
# ENTRYPOINT ./entrypoint.sh

