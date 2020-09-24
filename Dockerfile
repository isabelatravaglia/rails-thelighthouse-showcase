# Establishes the Ruby version on the Docker image. Must be compatible to the Ruby version on the Rails app.
FROM ruby:2.6.6

# Copy the application folder from the Rails app to the docker image.
COPY . /application
# Change to the application's directory
WORKDIR /application

#To avoid bundler error and install bundler to allow other dependencies
RUN gem install bundler

# Installs dependencies
# RUN bundle install --deployment --without development test => OLD VERSION
RUN bundle config set deployment 'true' without 'development test'

# RUN curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash - \
# sudo apt-get install -y nodejs

#Installing Nodejs
RUN curl -sL https://deb.nodesource.com/setup_10.x | bash -
RUN apt-get install -y nodejs

#To start the application in the production environment
ENV RAILS_ENV production

#The last instruction
ENTRYPOINT ./entrypoint.sh

