# Establishes the Ruby version on the Docker image. Must be compatible to the Ruby version on the Rails app.
FROM ruby:2.6.6

# Copy the application folder from the Rails app to the docker image.
COPY . /application
# Change to the application's directory
WORKDIR /application

#To start the application in the production environment
ENV RAILS_ENV production

#To avoid bundler error and install bundler to allow other dependencies
# Installs dependencies
# Installing Nodejs

#RUN gem install bundler \
 #   bundle config set deployment 'true' without 'development test' && \
  #  curl -sL https://deb.nodesource.com/setup_10.x | bash - && \
   # apt-get install -y nodejs

#RUN gem install bundler
#RUN bundle install --deployment --without development test
#RUN curl -sL https://deb.nodesource.com/setup_10.x | bash - \
     #&& apt-get install -y nodejs

RUN gem install bundler \
&& bundle config set deployment 'true' \
&& bundle config set without 'development test' \
&& bundle install \
&& curl -sL https://deb.nodesource.com/setup_10.x | bash - \
     && apt-get install -y nodejs


#The last instruction
ENTRYPOINT ./entrypoint.sh

