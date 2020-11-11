# Establishes the Ruby version on the Docker image. Must be compatible to the Ruby version on the Rails app.
# FROM ruby:2.6.6

# RUN gem install bundler
# RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - && \
#   echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list && \
#   apt-get update && apt-get install -y yarn
# RUN mkdir /application
# WORKDIR /application
# COPY Gemfile /application/Gemfile
# COPY Gemfile.lock /application/Gemfile.lock
# RUN bundle install
# COPY . /application

ARG RUBY_VERSION
FROM ruby:$RUBY_VERSION-slim-buster

ARG PG_MAJOR
ARG NODE_MAJOR
ARG BUNDLER_VERSION
# ARG YARN_VERSION

ARG UID
ENV UID $UID
ARG GID
ENV GID $GID
ARG USER=ruby
ENV USER $USER


RUN gem install bundler -v $BUNDLER_VERSION



# Common dependencies
RUN apt-get update -qq \
  && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    build-essential \
    gnupg2 \
    curl \
    less \
    git \
    sudo \
  && apt-get clean \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
  && truncate -s 0 /var/log/*log
  # && addgroup --gid $APP_GROUP_GID --system $APP_GROUP \
  # && adduser --system --shell /sbin/nologin -u $APP_USER_UID $APP_USER \
  # && adduser $APP_USER $APP_GROUP 

# Add PostgreSQL to sources list
RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# Add NodeJS to sources list
RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# Add Yarn to the sources list
RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# Install dependencies
COPY Aptfile /tmp/Aptfile
RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
  DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
    libpq-dev \
    postgresql-client-$PG_MAJOR \
    nodejs \
    yarn \
    $(cat /tmp/Aptfile | xargs) && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    truncate -s 0 /var/log/*log

# Configure bundler
ENV LANG=C.UTF-8 \
  BUNDLE_JOBS=4 \
  BUNDLE_RETRY=3

# Configure non-root user based on https://hint.io/blog/rails-development-with-docker
RUN groupadd -g $GID $USER && \
useradd -u $UID -g $USER -m $USER && \
usermod -p "*" $USER && \
usermod -aG sudo $USER && \
echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers.d/50-$USER


# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh


# RUN mkdir /application \
# && chown $APP_USER:$APP_GROUP /application
RUN mkdir -p /application && chown $USER:$USER /application
WORKDIR /application
# USER $APP_USER

# COPY --chown=$APP_USER:$APP_GROUP Gemfile /application/Gemfile
# COPY --chown=$APP_USER:$APP_GROUP Gemfile.lock /application/Gemfile.lock
COPY --chown=$USER:$USER Gemfile /application/Gemfile
COPY --chown=$USER:$USER Gemfile.lock /application/Gemfile.lock
COPY --chown=$USER:$USER node_modules /application/node_modules
COPY --chown=$USER:$USER public/packs /application/public/packs
COPY --chown=$USER:$USER tmp/cache /application/tmp/cache

USER $USER

RUN bundle install
# USER $APP_USER_UID
COPY --chown=$USER:$USER . /application

ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000


ENV RAILS_SERVE_STATIC_FILES true

RUN bundle exec rake assets:precompile

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]