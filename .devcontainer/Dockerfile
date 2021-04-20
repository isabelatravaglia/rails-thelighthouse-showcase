# https://github.com/isabelatravaglia/rails-base-image/Dockerfile.ruby266
FROM isabtra/rails-tlh-repo-dev:2.0

# ARG RUBY_VERSION
# FROM ruby:$RUBY_VERSION-slim-buster

# ARG PG_MAJOR
# ARG NODE_MAJOR
# ARG BUNDLER_VERSION
# ARG YARN_VERSION

# ARG UID
# ENV UID $UID
# ARG GID
# ENV GID $GID
# ARG USER=ruby
# ENV USER $USER

# # Common dependencies
# RUN apt-get update -qq \
#   && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
#     build-essential \
#     gnupg2 \
#     curl \
#     less \
#     git \
#     sudo \
#     iproute2 \
#     openssh-server \
#     openssh-client \
#   && apt-get clean \
#   && rm -rf /var/cache/apt/archives/* \
#   && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
#   && truncate -s 0 /var/log/*log


# # Add PostgreSQL to sources list
# RUN curl -sSL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
#   && echo 'deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main' $PG_MAJOR > /etc/apt/sources.list.d/pgdg.list

# # Add NodeJS to sources list
# RUN curl -sL https://deb.nodesource.com/setup_$NODE_MAJOR.x | bash -

# # Add Yarn to the sources list
# RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
#   && echo 'deb http://dl.yarnpkg.com/debian/ stable main' > /etc/apt/sources.list.d/yarn.list

# # Install dependencies
# COPY Aptfile /tmp/Aptfile
# RUN apt-get update -qq && DEBIAN_FRONTEND=noninteractive apt-get -yq dist-upgrade && \
#   DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends \
#     libpq-dev \
#     postgresql-client-$PG_MAJOR \
#     nodejs \
#     yarn=$YARN_VERSION-1 \
#     $(cat /tmp/Aptfile | xargs) && \
#     apt-get clean && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
#     truncate -s 0 /var/log/*log

# # Configure non-root user based on https://hint.io/blog/rails-development-with-docker
# RUN groupadd -g $GID $USER && \
# useradd -u $UID -g $USER -m $USER && \
# usermod -p "*" $USER && \
# usermod -aG sudo $USER && \
# echo "$USER ALL=NOPASSWD: ALL" >> /etc/sudoers.d/50-$USER


#####################################################################
RUN echo "force no-cache"

USER ruby

#Install software-properties-common to allow the command apt-add-repository to work
RUN sudo apt-get update -qq \
&& sudo apt-get install -yq --no-install-recommends \
  software-properties-common \
  openssh-client \
&& sudo apt-get clean \
&& sudo rm -rf /var/cache/apt/archives/* \
&& sudo rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \
&& sudo truncate -s 0 /var/log/*log

# Install Git Cli
RUN sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-key C99B11DEB97541F0 \ 
&& sudo apt-add-repository https://cli.github.com/packages \
&& sudo apt update -qq \
&& sudo apt install -y gh

# Install zsh
RUN sudo apt install -y zsh imagemagick jq \
&& sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

##########################################################################


# RUN mkdir -p /app && chown $USER:$USER /app
# WORKDIR /app

# RUN mkdir -p node_modules && chown $USER:$USER node_modules
# RUN mkdir -p public/packs && chown $USER:$USER public/packs
# RUN mkdir -p tmp/cache && chown $USER:$USER tmp/cache

# # Configure bundler
# ENV LANG=C.UTF-8 \
#   BUNDLE_JOBS=4 \
#   BUNDLE_RETRY=3

# WORKDIR /app
ARG BUNDLER_VERSION=2.1.4

RUN gem install bundler:$BUNDLER_VERSION

# COPY --chown=$USER:$USER Gemfile /app/Gemfile
# COPY --chown=$USER:$USER Gemfile.lock /app/Gemfile.lock

# USER $USER


# RUN bundle install
# RUN yarn install

# Add a script to be executed every time the container starts.
# COPY entrypoint.sh /usr/bin/
# RUN sudo chmod +x /usr/bin/entrypoint.sh

# ENTRYPOINT ["entrypoint.sh"]

# ENV RAILS_SERVE_STATIC_FILES true

# ENV PATH /app/bin:$PATH

ENV PATH /app/bin:$PATH