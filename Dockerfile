# syntax = docker/dockerfile:1

# This Dockerfile is designed for production, not development. Use with Kamal or build'n'run by hand:
# docker build -t my-app .
# docker run -d -p 80:80 -p 443:443 --name my-app -e RAILS_MASTER_KEY=<value from config/master.key> my-app

# Make sure RUBY_VERSION matches the Ruby version in .ruby-version
# syntax = docker/dockerfile:1

FROM ruby:3.2.2-slim

# # Install essential packages
RUN apt-get update -qq && \
apt-get install -y \
build-essential \
libpq-dev \
nodejs \
npm \
libyaml-dev \
curl \
git \
&& npm install -g yarn \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Set environment variables
ENV BUNDLE_PATH=/usr/local/bundle \
BUNDLE_BIN=/usr/local/bundle/bin \
GEM_HOME=/usr/local/bundle \
RAILS_ENV=production \
NODE_ENV=production \
RAILS_SERVE_STATIC_FILES=true

# Install specific bundler version
RUN gem install bundler -v '2.6.8'

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Configure bundler and install dependencies
RUN bundle config set --global force_ruby_platform true && \
    bundle config set --global without 'development test' && \
    bundle config set deployment 'true' && \
    bundle install --jobs 4 --retry 3

# Copy the rest of the application
COPY . .

# Precompile assets using a dummy secret key and dummy DB credentials
RUN SECRET_KEY_BASE=dummy \
    DATABASE_PASSWORD=dummy \
    DB_NAME=dummy \
    DB_USERNAME=dummy \
    DB_HOST=localhost \
    bundle exec rails assets:precompile

# Dockerfile
COPY localhost.key localhost.crt /app/

# Start the server
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]